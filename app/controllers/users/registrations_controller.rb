class Users::RegistrationsController < Devise::RegistrationsController
  protected

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def account_update_params
      params.require(resource_name).permit(:email, :password,  :password_confirmation,  configuration_attributes: [:id, :job_method, :track_job_results, :track_job_status, :preliminary_header_check, :job_notification, :job_notification_method, :notify_job_results, :notify_job_status])
    end
    def after_update_path_for(resource)
      edit_user_registration_path(resource)
    end
end
