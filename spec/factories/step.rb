FactoryGirl.define do
  factory :step, class: Jobs::Step do
    sequence(:order) { |n| n }

    factory :step_with_rules, class: Jobs::Step do
      transient do
        rule_count 2
      end

      after(:create) do |step, evaluator|
        create_list(:rule_with_atoms, evaluator.rule_count, step: step)
      end

      after(:create) do |step, evaluator|
        create_list(:nested_rule_with_atoms, evaluator.rule_count, step: step)
      end
    end
  end
end
