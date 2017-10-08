require "rails_helper"

RSpec.describe Atoms::Form::Select, type: :model  do
  let(:options) do
    {}
  end

  it_behaves_like "an atom rule" do
    let(:rule) { described_class.new(true, options) }
  end

  describe "when executing" do
    let(:page) { Capybara.string(File.read("spec/fixtures/sample_response.html")) }
  end
end
