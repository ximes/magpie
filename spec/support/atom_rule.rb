require "rails_helper"

RSpec.shared_examples "an atom rule"  do
  let(:rule) { described_class.new }

  it { expect(subject).to respond_to(:execute) }

  it "should have the right type" do
    expect(rule.class).to respond_to(:type)
  end

  it "has options" do
    expect(rule).to have_attributes(options)
  end

  it "expose options" do
    expect(rule).to respond_to(:accessible_options)
    expect(rule.accessible_options).to eq options.keys
  end

  xit "handles internal status"
  xit "exposes internal status"
end
