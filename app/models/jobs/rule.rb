class Jobs::Rule < ApplicationRecord
  has_closure_tree

  validates :order, numericality: true

  belongs_to :step, class_name: "Jobs::Step", inverse_of: :actions, foreign_key: "step_id"
  belongs_to :rule, class_name: "Rule", foreign_key: "atom_id"
end
