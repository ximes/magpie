class Jobs::Result < ApplicationRecord
  has_paper_trail

  validates :job, presence: true

  belongs_to :job

  def date
    created_at
  end

  def to_s
    "Job #{job} run at #{date}"
  end
end
