FactoryGirl.define do
  factory :rule do
    factory :rule_with_atoms do
      atom
    end
    factory :nested_rule_with_atoms do
      atom
      after(:create) do |rule|
        rule.children << build(:rule_with_atoms)
      end
    end
  end
end
