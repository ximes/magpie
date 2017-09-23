require "rails_helper"

RSpec.describe Atoms::Matcher::First, type: :model  do
  let(:options) do
    {}
  end

  it_behaves_like "an atom rule" do
    let(:rule) { described_class.new(true, options) }
  end

  describe "when executing" do
    let(:rule) { described_class.new(true, options) }
    let(:list) { Capybara.string(File.read("spec/fixtures/sample_response.html")).all(".ul-nth li") }
    let(:empty_list) { Capybara.string(File.read("spec/fixtures/sample_response.html")).all(".ul-no-nth li") }

    it "returns the first element" do
      expect { rule.execute(nil, rule, list) }.not_to raise_error
      expect(rule.execute(nil, rule, list).text).to eq("1")
    end

    it "returns the first element" do
      expect(rule.execute(nil, rule, empty_list)).to be_nil
    end
  end
end
