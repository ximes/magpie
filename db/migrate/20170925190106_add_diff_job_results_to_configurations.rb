class AddDiffJobResultsToConfigurations < ActiveRecord::Migration[5.1]
  def change
    add_column :configurations, :diff_job_results, :boolean
  end
end
