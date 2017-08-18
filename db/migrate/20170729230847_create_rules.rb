class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.references :step, foreign_key: true
      t.references :atom, foreign_key: true, index: true
      t.text :return_block
      t.boolean :enabled
      t.string :type
      t.integer :order, default: 0

      t.timestamps
    end
  end
end
