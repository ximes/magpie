require "rails_helper"

RSpec.describe Jobs::Step do
  describe "ActiveModel validations" do
    it { expect(subject).to validate_presence_of(:job) }
    it { expect(subject).to validate_numericality_of(:order) }
  end
  describe "ActiveModel associations" do
    it { expect(subject).to belong_to(:job) }
    it { expect(subject).to have_many(:actions).dependent(:destroy) }
    it { expect(subject).to have_many(:rules).dependent(:destroy) }
  end
end
