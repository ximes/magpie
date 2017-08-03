require "rails_helper"

RSpec.configure do
  def default_for(key, default)
    it "for #{key}" do
      expect(subject).to respond_to key
      expect(subject.send(key)).to eq default
    end
  end
end

RSpec.describe Configuration, type: :model  do
  context "has options with defaults" do
    default_for :track_job_results, false
    default_for :track_job_status, false
    default_for :job_method, :realtime
    default_for :preliminary_header_check, false
    default_for :job_notification, false
    default_for :job_notification_method, :log
  end

  describe "ActiveModel associations" do
    it { expect(subject).to belong_to(:configurable) }
  end

  describe "when default" do
    let(:user) { FactoryGirl.create(:user) }
    let(:configuration) { user.create_configuration attributes_for(:configuration) }

    it "belongs to a user" do
      expect(configuration).to respond_to(:configurable)
      expect(configuration.configurable).to match user
    end
  end

  describe "when overridable" do
    let(:job) { FactoryGirl.create(:valid_job) }
    let(:configuration) { job.create_configuration attributes_for(:configuration) }

    it "belongs to a job" do
      expect(configuration).to respond_to(:configurable)
      expect(configuration.configurable).to eq job
    end
  end

  describe "when overriding user configuration" do
    let(:default_configuration) { FactoryGirl.create(:configuration) }
    let(:configuration) { FactoryGirl.create(:job_configuration) }
    let(:job) { configuration.configurable }

    it "it can call configuration options directly" do
      job.job_method = :new_value

      expect(job.job_method).to eq :new_value
      expect(job.job_notification_method).to eq "log"
    end

    it "it can call configuration options through configuration object" do
      job.configuration.job_method = :new_value

      expect(job.configuration.job_method).to eq :new_value
      expect(job.configuration.job_notification_method).to eq "log"
    end
  end
end
