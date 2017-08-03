class CreateConfigurations < ActiveRecord::Migration[5.1]
  def change
    create_table :configurations do |t|
      t.string :track_job_results
      t.string :track_job_status
      t.string :job_method
      t.string :preliminary_header_check
      t.string :job_notification
      t.string :job_notification_method
      t.references :configurable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
