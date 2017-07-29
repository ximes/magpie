class Configuration
  # Track storage methods:
  # TODO: db|mongo|mysql|postgres|sqlite
  # default: sqlite
  attr_accessor :storage,
                # Track results : true | false
                :track_job_results,
                # Track job status : true | false
                :track_job_status,
                # Run methods: direct|cron/whenever|background jobs
                :job_method,
                # Mount web interface
                :web_panel,
                # Preliminary ping target page for last update: true | false
                :preliminary_header_check,
                # send status notification on requests
                :job_notification,
                # status notification channel: email|tg|sms|log|web interface
                :job_notification_method,
                # wrapper: watir
                :wrapper

  def initialize
    default_options.each do |variable, value|
      send("#{variable}=", value)
    end
  end

  private

    def default_options
      { storage: :default,
        track_job_results: false,
        track_job_status: false,
        job_method: :direct,
        web_panel: false,
        preliminary_header_check: false,
        job_notification: false,
        job_notification_method: :log,
        wrapper: :watir }
    end
end
