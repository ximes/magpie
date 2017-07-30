class Jobs::Action < ApplicationRecord
  self.table_name = "jobs_actions"

  validates :order, numericality: true

  belongs_to :step, class_name: "Jobs::Step", inverse_of: :actions
  belongs_to :action, class_name: "Action"
end
