require "rails_helper"

RSpec.describe Atoms::Base, type: :model do
  context "shared methods" do
    describe "when creating a new child class" do
      before do
        module Atoms::TestModule; class TestClass < Atoms::Base; end; end
      end

      let (:child_class) { Atoms::TestModule::TestClass }

      it "should return the correct type" do
        expect(child_class.type).to eq "TestModule"
      end
    end
  end

  describe "preventing standalone usage" do
    it "should not have a type" do
      expect(described_class.type).to be_empty
    end
  end
end
