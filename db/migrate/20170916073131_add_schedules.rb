class AddSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedulers do |t|
      t.references :job, foreign_key: true
      t.text :schedule
      t.time :time
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
