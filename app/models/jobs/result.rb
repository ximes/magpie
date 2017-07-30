class Jobs::Result < ApplicationRecord
  self.table_name = "jobs_results"
  validates :job, presence: true

  belongs_to :job

  def date
    create_at
  end
end
