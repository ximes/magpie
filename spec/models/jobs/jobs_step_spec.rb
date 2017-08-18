require "rails_helper"

RSpec.describe Jobs::Step do
  describe "ActiveModel validations" do
    it { expect(subject).to validate_presence_of(:job) }
    it { expect(subject).to validate_numericality_of(:order) }
  end
  describe "ActiveModel associations" do
    it { expect(subject).to belong_to(:job) }
    it { expect(subject).to have_many(:rules).dependent(:destroy) }
  end

  describe "when returning children" do
    let!(:job) { create :valid_job }
    let!(:step) { job.steps.create }
    let!(:first_child) { build(:atom, name: "first child") }

    before do
      step.rules.build(atom: first_child)
      step.save!
    end

    it "should return orphans" do
      expect(step.rules.root.name).to eq("first child")
    end

    it "should return all" do
      children = ["child 1", "child 2"]
      children.each do |child|
        step.rules.first.children << step.rules.build(atom: build(:atom, name: child))
      end

      expect(step.rules.root.name).to eq("first child")
      expect(step.rules.first.descendants.map(&:name)).to eq(children)
      expect(step.rules.first.self_and_descendants.map(&:name)).to eq([first_child.name] + children)
    end
  end
end
