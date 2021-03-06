require "rails_helper"

RSpec.describe User, type: :model do
  describe "ActiveModel associations" do
    it { expect(subject).to have_many(:jobs).dependent(:destroy) }
    it { expect(subject).to have_one(:configuration) }
  end
end
