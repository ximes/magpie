class Job < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :url, presence: true, url: true

  has_many :steps, dependent: :destroy, class_name: "Jobs::Step", inverse_of: :job
  has_many :rules, through: :steps
  has_many :actions, through: :steps

  has_one :result, class_name: "Jobs::Result", dependent: :destroy

  include Configurable

  belongs_to :user

  def results
    result.versions
  end
end
