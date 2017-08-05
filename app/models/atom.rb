class Atom < ApplicationRecord
  has_closure_tree

  validates :name, presence: true
  validates :class_name, presence: true
end
