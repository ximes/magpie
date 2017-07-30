class Jobs::Result < ApplicationRecord
  validates :job, presence: true

  belongs_to :job

  def date
    create_at
  end
end
