class Jobs::Action < ApplicationRecord
  has_closure_tree

  validates :order, numericality: true

  belongs_to :step, class_name: "Jobs::Step", inverse_of: :actions, foreign_key: "step_id"
  belongs_to :action, class_name: "Action", foreign_key: "atom_id"
end
