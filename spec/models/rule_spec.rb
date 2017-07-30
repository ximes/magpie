require "rails_helper"

RSpec.describe Rule, type: :model  do
  describe "ActiveModel validations" do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:class_name) }
    it { expect(subject).to respond_to(:enabled?) }
  end
  describe "ActiveModel associations" do
    it { expect(subject).to have_many(:jobs_rules) }
  end
  context "when using a css selector" do
    xit "can match a class"
    xit "can match an id"
    xit "can match a pseudo selector"
    xit "can match a descending selector"
    xit "match the #n child"
    xit "match last child"
    xit "match first child"
    xit "match sibling"
    xit "match disabled"
    xit "check whether it is a link"
    xit "check whether it is an image"
    xit "check whether it is an button"
    xit "check whether it is visible"
    xit "check whether it is disabled"
    xit "check whether it is a text field"
    xit "check whether it is a upload field"
    xit "check whether it is a checkbox"
    xit "check whether it is a radio button"
    xit "check whether it is a textarea"
    xit "check whether it is a select"
    xit "check whether it is within a table"
    xit "check whether it is a dropdown menu"
  end
  xit "do math/block checks"
  xit "find if there is a captcha field"
  xit "check captcha field type"
  xit "check whether is pagination"
  xit "evaluate info from the values table"
end
