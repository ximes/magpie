class AddNotifyOptionsToConfigurations < ActiveRecord::Migration[5.1]
  def change
    add_column :configurations, :notify_job_results, :boolean
    add_column :configurations, :notify_job_status, :boolean
  end
end
