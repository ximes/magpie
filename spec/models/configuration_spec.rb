require "rails_helper"

RSpec.configure do
  def default_for(key, default)
    it "for #{key}" do
      expect(config).to respond_to key
      expect(config.send(key)).to eq default
    end
  end
end

RSpec.describe Magpie::Configuration do
  let(:config) { described_class.new }

  context "has options with defaults" do
    default_for :storage, :default
    default_for :track_job_results, false
    default_for :track_job_status, false
    default_for :job_method, :direct
    default_for :web_panel, false
    default_for :preliminary_header_check, false
    default_for :job_notification, false
    default_for :job_notification_method, :log
    default_for :wrapper, :watir
  end
end
