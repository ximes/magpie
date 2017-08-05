class Jobs::Rule < ApplicationRecord
  validates :order, numericality: true

  belongs_to :step, class_name: "Jobs::Step", inverse_of: :actions, foreign_key: "jobs_steps_id"
  belongs_to :rule, class_name: "Rule", foreign_key: "atom_id"
end
