class Jobs::Action < ApplicationRecord
  validates :order, numericality: true

  belongs_to :step, class_name: "Jobs::Step", inverse_of: :actions, foreign_key: "jobs_steps_id"
  belongs_to :action, class_name: "Action"
end
