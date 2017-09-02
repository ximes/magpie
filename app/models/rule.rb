class Rule < ApplicationRecord
  acts_as_nested_set order_column: :order

  validates :order, numericality: true

  belongs_to :step, inverse_of: :rules, foreign_key: "step_id", class_name: "Jobs::Step"
  belongs_to :atom, foreign_key: "atom_id"

  scope :first_children, -> { where(parent_id: nil).order(order: :asc) }

  def name
    "#{atom.name}"
  end
end
