require "rails_helper"

RSpec.configure do
  def default_for(key, default)
    it "for #{key}" do
      expect(subject).to respond_to key
      expect(subject.send(key)).to eq default
    end
  end
end

def default_options
  {
    track_job_results: false,
    track_job_status: false,
    job_method: :realtime,
    preliminary_header_check: false,
    job_notification: false,
    job_notification_method: :log
  }
end

RSpec.describe Configuration, type: :model  do

  context "has options with defaults" do
    default_options.each do |option, value|
      default_for option, value
    end
    it "returns right attributes for comparisons" do
      expect(subject.accessible_attributes).to eq default_options
    end
  end

  describe "ActiveModel associations" do
    it { expect(subject).to belong_to(:configurable) }
  end

  describe "when belongs to a user" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      user.build_configuration
    end

    it "loads default values" do
      default_options.each do |option, value|
        expect(user.configuration.send(option)).to eq value
      end
    end

    it "it can call configuration options through configuration object" do
      user.configuration.job_method = :new_value

      expect(user.configuration.job_method).to eq :new_value
      expect(user.configuration.job_notification_method).to eq :log
    end
  end
end
