Sidekiq::Cron::Job.create(name: 'Scheduler - every 10min', cron: '*/1 * * * *', class: 'SchedulerWorker') unless Rails.env.test? || Rails.env.development?
