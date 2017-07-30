class CreateJobsSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs_steps do |t|
      t.references :job
      t.integer :order, default: 0
      t.timestamps
    end
  end
end
