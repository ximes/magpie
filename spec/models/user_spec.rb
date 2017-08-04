require "rails_helper"

RSpec.describe User, type: :model do
  describe "ActiveModel associations" do
    it { expect(subject).to have_many(:jobs).dependent(:destroy) }
    it { expect(subject).to have_one(:configuration) }
  end

  describe "when initializing" do
    it "it should create a new config object" do
      expect(subject.configuration).not_to be_nil
    end
  end
end
