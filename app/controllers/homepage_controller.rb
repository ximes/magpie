class HomepageController < ApplicationController
  layout "homepage"
  skip_before_action :authenticate_user!

  def index
  end
end
