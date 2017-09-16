require "rails_helper"

RSpec.describe Jobs::Scheduler, type: :model  do
  describe "ActiveModel validations" do
    it { expect(subject).to validate_presence_of(:job) }
    it { expect(subject).to validate_presence_of(:time) }
    it { expect(subject).to respond_to(:enabled?) }
  end

  describe "ActiveModel associations" do
    it { expect(subject).to belong_to(:job) }
  end

  xit "can run it now"
  xit "can run it at"
  xit "can set a recurrent"
  xit "can stop recurrency"
  xit "can see last run timestamp"
  xit "can see last run status"
  xit "can see all versions"
  xit "can see last version"
end
