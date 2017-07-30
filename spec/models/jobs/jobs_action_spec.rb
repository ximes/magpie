require "rails_helper"

RSpec.describe Jobs::Action do
  describe "ActiveModel validations" do
    it { expect(subject).to validate_numericality_of(:order) }
  end
  describe "ActiveModel associations" do
    it { expect(subject).to belong_to(:action) }
    it { expect(subject).to belong_to(:step) }
  end
end
