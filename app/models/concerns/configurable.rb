require "active_support/concern"

module Configurable
  extend ActiveSupport::Concern

  included do
    has_one :configuration, as: :configurable

    accepts_nested_attributes_for :configuration, reject_if: :all_blank
  end
end
