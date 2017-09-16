class Atom < ApplicationRecord
  validates :name, presence: true
  validates :class_name, presence: true

  default_scope -> { where(enabled: true) }
end
