module Atomizable
  extend ActiveSupport::Concern
  has_closure_tree
  included do

    validates :name, presence: true
    validates :class_name, presence: true
  end
end
