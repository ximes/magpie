class CreateJobsRules < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs_rules do |t|
      t.references :step, foreign_key: true
      t.references :rule, foreign_key: true
      t.text :return_block
      t.boolean :enabled
      t.integer :order, default: 0

      t.timestamps
    end
  end
end
