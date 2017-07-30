class Jobs::Step < ApplicationRecord
  validates :job, presence: true
  validates :order, numericality: true

  belongs_to :job
  has_many :actions, class_name: "Jobs::Action", dependent: :destroy, foreign_key: "jobs_steps_id"
  has_many :rules, class_name: "Jobs::Rule", dependent: :destroy, foreign_key: "jobs_steps_id"
end
