require "active_support/concern"

module Configurable
  extend ActiveSupport::Concern

  included do
    has_one :configuration, as: :configurable

  end
end
