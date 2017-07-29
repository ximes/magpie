require "spec_helper"

RSpec.describe Magpie do
  it "has a version number" do
    expect(Magpie::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
