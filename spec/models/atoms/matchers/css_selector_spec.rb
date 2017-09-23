require "rails_helper"

RSpec.describe Atoms::Matchers::CssSelector, type: :model  do
  let(:options) do
    {
      selector: ".first-selector"
    }
  end

  it_behaves_like "an atom rule" do
    let(:rule) { described_class.new(true, options) }
  end

  def rule_by_selector(selector)
    described_class.new(true, selector: selector)
  end

  describe "when executing" do
    let(:page) { Capybara.string(File.read("spec/fixtures/sample_response.html")) }

    it "does not fail if not found" do
      rule = rule_by_selector(".non-existent-class")
      expect { rule.execute(nil, rule, page) }.not_to raise_error
      expect(rule.execute(nil, rule, page)).to be_empty
    end

    it "can match a class" do
      rule = rule_by_selector(".test-class")
      expect(rule.execute(nil, rule, page)).to all(be_a(Capybara::Node::Simple))
      expect(rule.execute(nil, rule, page).size).to eq(2)
      expect(rule.execute(nil, rule, page).map(&:text)).to all(eq("Target!"))
    end

    it "can match an id" do
      rule = rule_by_selector("#test-id")
      expect(rule.execute(nil, rule, page)).to all(be_a(Capybara::Node::Simple))
      expect(rule.execute(nil, rule, page).size).to eq(1)
      expect(rule.execute(nil, rule, page).map(&:text)).to all(eq("Target!"))
    end

    it "can match a descending selector" do
      rule = rule_by_selector(".parent-class .child-class")
      expect(rule.execute(nil, rule, page)).to all(be_a(Capybara::Node::Simple))
      expect(rule.execute(nil, rule, page).size).to eq(2)
      expect(rule.execute(nil, rule, page).map(&:text)).to all(eq("Target!"))
    end

    it "can match a child selector" do
      rule = rule_by_selector(".parent-class > .child-class")
      expect(rule.execute(nil, rule, page)).to all(be_a(Capybara::Node::Simple))
      expect(rule.execute(nil, rule, page).size).to eq(1)
      expect(rule.execute(nil, rule, page).map(&:text)).to all(eq("Target!"))
    end

    # TO be moved to first-nth-all atoms
    xit "match the #n child" do
      raise TODO
    end
    xit "match all children" do
      raise TODO
    end
    xit "match last child" do
      raise TODO
    end
    xit "match first child" do
      raise TODO
    end

    it "match disabled" do
      rule = rule_by_selector(".disabled-input")
      expect(rule.execute(nil, rule, page)).to all(be_a(Capybara::Node::Simple))
      expect(rule.execute(nil, rule, page).size).to eq(1)
      expect(rule.execute(nil, rule, page).map(&:value)).to all(eq("Target!"))
    end

    it "match checked" do
      rule = rule_by_selector(".checked-input")
      expect(rule.execute(nil, rule, page)).to all(be_a(Capybara::Node::Simple))
      expect(rule.execute(nil, rule, page).size).to eq(1)
      expect(rule.execute(nil, rule, page).map(&:value)).to all(eq("Target!"))
    end

    it "match readonly" do
      rule = rule_by_selector(".readonly-input")
      expect(rule.execute(nil, rule, page)).to all(be_a(Capybara::Node::Simple))
      expect(rule.execute(nil, rule, page).size).to eq(1)
      expect(rule.execute(nil, rule, page).map(&:value)).to all(eq("Target!"))
    end
  end
end
