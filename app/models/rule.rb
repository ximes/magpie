class Rule < ApplicationRecord
  acts_as_nested_set

  validates :order, numericality: true

  belongs_to :step, inverse_of: :rules, foreign_key: "step_id", class_name: "Jobs::Step"
  belongs_to :atom, foreign_key: "atom_id"

  scope :first_children, -> { where(parent_id: nil) }

  store :options, coder: JSON

  def name
    "#{atom.name}"
  end

  def nestable?
    atom.class_name.constantize.nestable?
  end

  def atom_instance
    atom.class_name.constantize.new(enabled, options)
  end
end
