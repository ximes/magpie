Sidekiq::Cron::Job.create(name: 'Scheduler - every 10min', cron: '*/10 * * * *', class: 'SchedulerWorker')
