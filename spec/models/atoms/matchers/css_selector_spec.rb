require "rails_helper"

RSpec.describe Atoms::Matchers::CssSelector, type: :model  do
  let(:options) do
    {
      selector: ".first-selector"
    }
  end

  it_behaves_like "an atom rule" do
    let(:rule) { described_class.new(options) }
  end

  describe "when executing" do
    xit "can match a class" do
      raise TODO
    end
    xit "can match an id" do
      raise TODO
    end
    xit "can match a pseudo selector" do
      raise TODO
    end
    xit "can match a descending selector" do
      raise TODO
    end
    xit "match the #n child" do
      raise TODO
    end
    xit "match last child" do
      raise TODO
    end
    xit "match first child" do
      raise TODO
    end
    xit "match sibling" do
      raise TODO
    end
    xit "match disabled" do
      raise TODO
    end
    xit "match checked" do
      raise TODO
    end
    xit "match readonly" do
      raise TODO
    end
  end
end
