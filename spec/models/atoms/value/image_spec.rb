require "rails_helper"

RSpec.describe Atoms::Value::Image, type: :model  do
  let(:options) do
    {}
  end

  it_behaves_like "an atom rule" do
    let(:rule) { described_class.new(true, options) }
  end

  describe "when executing" do
    let(:job) { build(:job) }
    let(:rule) { described_class.new(true, options) }
    let(:list) { Capybara.string(File.read("spec/fixtures/sample_response.html")).first(".image-class img") }
    let(:empty_list) { Capybara.string(File.read("spec/fixtures/sample_response.html")).first(".ul-no-image_class img") }

    before do
      allow(job).to receive(:result_contents).and_return([])
    end

    it "returns the image url" do
      expect(rule.execute(job, rule, list)).to eq("Img: https://dummyimage.com/600x400/000/fff")
    end

    it "doesn't break for the last element" do
      expect(rule.execute(job, rule, empty_list)).to be_nil
    end
  end
end
