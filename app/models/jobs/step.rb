class Jobs::Step < ApplicationRecord
  validates :job, presence: true
  validates :order, numericality: true

  belongs_to :job
  has_many :rules, -> { first_children }, dependent: :destroy, foreign_key: "step_id"
end
