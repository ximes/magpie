class Rule < ApplicationRecord
  validates :name, presence: true
  validates :class_name, presence: true

  has_many :jobs_rules, class_name: "Jobs::Rule"
end
