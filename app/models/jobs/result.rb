class Jobs::Result < ApplicationRecord
  has_paper_trail

  validates :job, presence: true

  belongs_to :job

  def date
    create_at
  end
end
