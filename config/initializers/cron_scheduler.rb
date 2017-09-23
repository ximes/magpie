Sidekiq::Cron::Job.create(name: "Scheduler - every minute", cron: "*/1 * * * *", class: "SchedulerJob") unless Rails.env.test? || Rails.env.development?
