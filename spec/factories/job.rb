FactoryGirl.define do
  factory :job do
    name "I'm a job!"
    start_date Date.today
    user

    factory :valid_job do
      url "http://www.google.com"
      enabled true

      factory :valid_job_with_rules do
        transient do
          step_count 2
          single_rule true
        end

        after(:create) do |job, evaluator|
          if evaluator.single_rule
            create_list(:step_with_rules, evaluator.step_count, job: job, rule_count: 1)
          else
            create_list(:step_with_rules, evaluator.step_count, job: job)
          end
        end
      end

      factory :valid_job_with_step do
        transient do
          step_count 1

          after(:create) do |job, evaluator|
            create_list(:step, evaluator.step_count, job: job)
          end
        end
      end
    end
  end
end
