require "rails_helper"

RSpec.describe Atom, type: :model  do
  describe "ActiveModel validations" do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:class_name) }
    it { expect(subject).to respond_to(:enabled?) }
  end
end
