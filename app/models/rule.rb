class Rule < ApplicationRecord
  has_closure_tree

  validates :order, numericality: true

  belongs_to :step, inverse_of: :rules, foreign_key: "step_id", class_name: "Jobs::Step"
  belongs_to :atom, foreign_key: "atom_id"

  def name
    "#{atom.name}"
  end
end
