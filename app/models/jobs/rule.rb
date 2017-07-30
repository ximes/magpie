class Jobs::Rule < ApplicationRecord
  self.table_name = "jobs_rules"

  validates :order, numericality: true

  belongs_to :step, class_name: "Jobs::Step", inverse_of: :actions
  belongs_to :rule, class_name: "Rule"
end
