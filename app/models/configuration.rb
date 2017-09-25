class Configuration < ApplicationRecord
  belongs_to :configurable, polymorphic: true, required: false, inverse_of: :configuration

  # Track results : true | false
  attribute :track_job_results, :boolean, default: false
  attribute :diff_job_results, :boolean, default: false
  # Track job status : true | false
  attribute :track_job_status, :boolean, default: false
  # Run methods: direct|cron/whenever|background jobs
  attribute :job_method, default: :realtime
  # Preliminary ping target page for last update: true | false
  attribute :preliminary_header_check, :boolean, default: false
  # send status notification on requests
  attribute :job_notification, :boolean, default: false
  # status notification channel: email|tg|sms|log|web interface
  attribute :job_notification_method, default: :log
  attribute :notify_job_results, default: :false
  attribute :notify_job_status, default: :false

  def accessible_attributes
    attributes.symbolize_keys.except(:id, :created_at, :updated_at, :configurable_id, :configurable_type)
  end
end
