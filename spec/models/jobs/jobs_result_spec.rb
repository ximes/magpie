require "rails_helper"

RSpec.describe Jobs::Result, type: :model  do
  describe "ActiveModel validations" do
    it { expect(subject).to validate_presence_of(:job) }
    it { expect(subject).to respond_to(:result) }
    it { expect(subject).to respond_to(:date) }
  end

  describe "ActiveModel associations" do
    it { expect(subject).to belong_to(:job) }
    # TODO test for accepts_nested_attributes_for
  end
end
