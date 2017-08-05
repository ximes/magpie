class AddCustomizableToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :customizable , :boolean
  end
end
