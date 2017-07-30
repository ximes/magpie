require "rails_helper"

RSpec.describe Job do
  describe "ActiveModel validations" do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:start_date) }
    it { expect(subject).to respond_to(:end_date) }
    it { expect(subject).to validate_presence_of(:url) }
    # TODO xit { expect(subject).to be_a_valid_url(:url) }
    it { expect(subject).to respond_to(:enabled?) }
  end
  describe "ActiveModel associations" do
    it { expect(subject).to have_many(:steps).dependent(:destroy)  }
    it { expect(subject).to have_many(:actions).through(:steps) }
    it { expect(subject).to have_many(:rules).through(:steps) }

    xit { expect(subject).to have_one(:result).through(:results) }
    xit { expect(subject).to have_one(:status).through(:result) }
    xit { expect(subject).to have_one(:results).dependent(:destroy) }
    # TODO test for accepts_nested_attributes_for
  end

  # xit 'has a notification_channel' TODO
  # xit 'has a user' TODO
  # xit 'has a base_url_type (protected, unprotected)'
  # xit 'has a auth_credentials (protected, unprotected)' TODO

  xit "can be enabled or not"
  xit "can be scheduled"
  xit "can be launched"
  xit "can check for page updates base on previous version"
  xit "can check for page updates in the last (n) amount of time"
  xit "it can parse html"

  xit "can make a unique summary of itself"

  xit "has a rate failure"
end
