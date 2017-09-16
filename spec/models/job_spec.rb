require "rails_helper"

RSpec.describe Job, type: :model  do
  describe "ActiveModel validations" do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:start_date) }
    it { expect(subject).to respond_to(:end_date) }
    it { expect(subject).to validate_presence_of(:url) }
    it { expect(subject).to respond_to(:status) }
    it { expect(subject).to respond_to(:enabled?) }

    let (:job) { build(:job) }

    it "accepts valid url" do
      job.url = "http://www.google.com"
      expect(job).to be_valid(:url)
    end

    ["www.google.com" , "noturl//url"].each do |url|
      it "refuses invalid url" do
        job.url = url
        expect(job).not_to be_valid(:url)
      end
    end
  end

  describe "ActiveModel associations" do
    it { expect(subject).to have_many(:steps).dependent(:destroy)  }
    it { expect(subject).to have_many(:rules).through(:steps) }
    it { expect(subject).to have_one(:result).dependent(:destroy) }
    it { expect(subject).to respond_to(:results) }
    it { expect(subject).to belong_to(:user) }
    xit { expect(subject).to have_one(:status).through(:result) }
    it { expect(subject).to have_one(:configuration) }
    # TODO test for accepts_nested_attributes_for
  end

  describe "when it does have its own configuration" do
    before do
      subject.customizable = true
      subject.build_configuration
    end

    it "it gets default configuration options" do
      expect(subject.configuration.job_notification_method).to eq :log
    end

    it "it get default configuration options" do
      subject.configuration.job_notification_method = :new_value
      expect(subject.configuration.job_notification_method).to eq :new_value
    end
  end

  describe "when it doesn't have its own configuration" do
    let!(:user) { FactoryGirl.build(:user_configuration).configurable }

    before do
      subject.customizable = false
      subject.user = user
      subject.user.configuration.job_method = :new_value
    end

    it "it can call configuration options through configuration object" do
      expect(subject.configuration.job_method).to eq user.configuration.job_method
    end
  end

  describe "when set up" do
    it "can be launched" do
      expect(subject).to respond_to(:perform)
    end
  end
  describe "when performed" do
    let(:subject) { create :valid_job_with_rules }
    before do
    end

    xit "runs through all rules" do
      save_count = 0

      allow_any_instance_of(Atoms::Test::Test).to receive(:execute) do |args|
        save_count += 1
      end.and_call_original

      subject.perform

      expect(save_count).to eq(8)
    end

    with_versioning do
      let!(:results_count) do
        subject.create_result(result: "Result", status: Jobs::Status::Failed.new.to_s)
        subject.results.length
      end

      it "saves a new result" do
        allow_any_instance_of(Atoms::Test::Test).to receive(:execute) do |a, b, c, d|
          b.result_contents << "Updated Result"
          b.result_status = Jobs::Status::Successful.new.to_s
        end
        subject.perform!
        expect(subject.results.length).to eq(results_count + 1)
      end

      xit "have result and status" do
        allow_any_instance_of(Atoms::Test::Test).to receive(:execute) do |a, b, c, d|
          b.result_contents << "Updated Result"
          b.result_status = Jobs::Status::Successful.new.to_s
        end
        subject.perform!

        expect(subject.result.versions.last.reify.status).to eq("Successful")
        expect(subject.results.last.reify.result).to eq("Updated Result")
      end
    end
  end
  # xit 'has a notification_channel' TODO
  # xit 'has a base_url_type (protected, unprotected)'
  # xit 'has a auth_credentials (protected, unprotected)' TODO

  xit "can be enabled or not"
  xit "can be scheduled"
  xit "can check for page updates base on previous version"
  xit "can check for page updates in the last (n) amount of time"
  xit "it can parse html"

  xit "can make a unique summary of itself"

  xit "has a rate failure"
end
