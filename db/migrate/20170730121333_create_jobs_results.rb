class CreateJobsResults < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs_results do |t|
      t.references :job, foreign_key: true
      t.text :result

      t.timestamps
    end
  end
end
