require "rails_helper"

RSpec.describe Jobs::Status, type: :model  do
  it "can be failed" do
    expect(described_class::Failed.new.to_s).to eq("Failed")
  end
  it "can be successful" do
    expect(described_class::Successful.new.to_s).to eq("Successful")
  end
  it "can be timeout" do
    expect(described_class::Timeout.new.to_s).to eq("Timed out")
  end
end
