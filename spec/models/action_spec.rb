require "rails_helper"

RSpec.describe Action do
  describe "ActiveModel validations" do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:class_name) }
    it { expect(subject).to respond_to(:enabled?) }
  end
  describe "ActiveModel associations" do
    it { expect(subject).to have_many(:jobs_actions) }
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
end
