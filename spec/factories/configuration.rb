FactoryGirl.define do
  factory :configuration do
    track_job_results false
    track_job_status false
    diff_job_results false
    job_method :realtime
    preliminary_header_check false
    job_notification false
    job_notification_method :log
    notify_job_results false
    notify_job_status false

    factory :job_configuration do
      association :configurable, factory: :valid_job
    end
    factory :user_configuration do
      association :configurable, factory: :user
    end

  end
end
