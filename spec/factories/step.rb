FactoryGirl.define do
  factory :step, class: Jobs::Step do
    sequence(:order) { |n| n }
  end
end
