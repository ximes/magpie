require "rails_helper"

RSpec.describe Rule, type: :model  do
  describe "ActiveModel validations" do
    it { expect(subject).to validate_numericality_of(:order) }
  end

  describe "ActiveModel associations" do
    it { expect(subject).to belong_to(:atom) }
    it { expect(subject).to belong_to(:step) }
  end

  describe "when behaving like a graph" do
    it "can be attached to a parent" do
      expect(subject).to respond_to(:parent)
    end
    it "can have many children" do
      expect(subject).to respond_to(:children)
    end
  end

  xit "can click"
  xit "can fill form"
  xit "can follow link"
  xit "can follow pagination"
  xit "wait for page to load"
  xit "wait for element to load"
  xit "confirm on javascript dialog"
  xit "cancel on javascript dialog"
  xit "can complete captcha"
  xit "can refresh page"
  xit "can fill field with value"
  xit "can choose from a dropdown menu"
  xit "can choose from a selection field"
  xit "can choose from a radio box"
  xit "can mark a check box"
  xit "can upload file"
  xit "call an external service"
  xit "do math/block operations"
  xit "can increase counter (counter name)"
  xit "save info key to a values table"
  xit "delete info key from a values table"
  xit "copy to cliboard" # to copy and past inside the same job/page
  xit "paste from cliboard" # to copy and past inside the same job/page
  xit "export a rendered page"

  xit "return its value"
  xit "return its plain text content"
  xit "return its tag attributes as object attributes"
  xit "search for its attributes (1..n attributes)"

  xit "if block"
  xit "else block"
  xit "for block"

  xit "mark as successful"
  xit "mark as failed"
  xit "debug"

  xit "return number of children"
  xit "return number of siblings"

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
