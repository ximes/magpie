FactoryGirl.define do
  factory :job do
    name "I'm a job!"
    start_date Date.today
    user

    factory :valid_job do
      url "http://www.google.com"
    end
  end
end
