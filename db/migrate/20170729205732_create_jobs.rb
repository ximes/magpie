class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.boolean :enabled
      t.date :start_date
      t.date :end_date
      t.string :url

      t.timestamps
    end
  end
end
