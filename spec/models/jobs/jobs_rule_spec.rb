require "rails_helper"

RSpec.describe Jobs::Rule, type: :model  do
  describe "ActiveModel validations" do
    it { expect(subject).to validate_numericality_of(:order) }
  end

  describe "ActiveModel associations" do
    it { expect(subject).to belong_to(:rule) }
    it { expect(subject).to belong_to(:step) }
  end

  describe "when behaving like a graph" do
    it "can be attached to a parent" do
      expect(subject).to respond_to(:parent)
    end
    it "can have many children" do
      expect(subject).to respond_to(:children)
    end
  end
end
