class Action < ApplicationRecord
  validates :name, presence: true
  validates :class_name, presence: true

  has_many :jobs_actions, class_name: "Jobs::Action"
end
