# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  layout :determine_layout

  def after_sign_in_path_for(resource)
    jobs_path || root_path
  end

  private

    def determine_layout
      current_user ? "application" : "homepage"
    end
end
