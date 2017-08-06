require "rails_helper"

RSpec.describe Atom, type: :model  do
  describe "ActiveModel validations" do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:class_name) }
    it { expect(subject).to respond_to(:enabled?) }
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
