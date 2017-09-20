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
    it { expect(subject).to have_one(:configuration) }
    it { expect(subject).to have_many(:schedulers) }
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

    it "doesn't run if not enabled" do
      subject.update_attribute(:enabled, false)
      subject.perform

      expect_any_instance_of(Atoms::Test::Test).not_to receive(:execute)
    end

    xit "can be scheduled"
    xit "can check for page updates in the last (n) amount of time"

    xit "can make a unique summary of itself"

    it "cycles through all rules at least once" do
      save_count = 0
      allow_any_instance_of(Atoms::Test::Test).to receive(:execute) do |args|
        save_count += 1
      end
      subject.perform

      expect(save_count).to eq(subject.rules.count)
    end

    context "raising errors" do
      let(:error_to_raise) { "Generic error" }

      before do
        allow_any_instance_of(Atoms::Test::Test).to receive(:execute).and_raise(error_to_raise)
      end

      it "catches errors with a failed job status" do
        expect { subject.perform! }.not_to raise_error
        expect(subject.result.result).to eq(error_to_raise)
        expect(subject.result.result).to be_present
        expect(subject.result.status).to eq(Jobs::Status::Failed.new.to_s)
      end
    end

    with_versioning do
      let!(:job) { create(:valid_job_with_rules) }
      let!(:job_with_one_rule) { create(:valid_job_with_rules, step_count: 1) }

      let!(:results_count) do
        job.create_result(result: "Result", status: Jobs::Status::Failed.new.to_s)
        job.results.length
      end

      it "saves a new result" do
        allow_any_instance_of(Atoms::Test::Test).to receive(:execute) do |a, b, c, d|
          b.result_contents << "Updated Result"
          b.result_status = Jobs::Status::Successful.new.to_s
        end
        job.perform!
        expect(job.results.length).to eq(results_count + 1)
      end

      it "have result and status" do
        allow_any_instance_of(Atoms::Test::Test).to receive(:execute) do |a, b, c, d|
          b.result_contents << "Updated Result"
          b.result_status = Jobs::Status::Successful.new.to_s
        end

        job.perform!

        expect(job.results.first.status).to eq("Successful")
        expect(job.results.first.result).to eq("Updated Result" * job.rules.count)
      end

      it "doesn't save a new result if no changes are detected" do
        allow_any_instance_of(Atoms::Test::Test).to receive(:execute) do |a, b, c, d|
          b.result_contents << "Result"
          b.result_status = Jobs::Status::Successful.new.to_s
        end

        job_with_one_rule.perform!

        expect(job_with_one_rule.results.length).to eq(results_count)
      end
    end
  end

  # xit 'has a notification_channel' TODO
  # xit 'has a base_url_type (protected, unprotected)'
  # xit 'has a auth_credentials (protected, unprotected)' TODO
  # xit "has a rate failure"
end
