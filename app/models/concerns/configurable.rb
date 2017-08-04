require "active_support/concern"

module Configurable
  extend ActiveSupport::Concern

  included do
    has_one :configuration, as: :configurable
    delegate :track_job_results, :track_job_results=, :track_job_status, :track_job_status=, :job_method, :job_method=, :preliminary_header_check, :preliminary_header_check=, :job_notification, :job_notification=, :job_notification_method, :job_notification_method=, to: :configuration

    after_initialize :init_configuration

    def init_configuration
      configuration || build_configuration
    end
  end
end
