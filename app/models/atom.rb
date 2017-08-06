class Atom < ApplicationRecord
  validates :name, presence: true
  validates :class_name, presence: true
end
