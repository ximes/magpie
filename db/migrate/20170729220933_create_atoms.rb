class CreateAtoms < ActiveRecord::Migration[5.1]
  def change
    create_table :atoms do |t|
      t.string :name
      t.boolean :enabled
      t.string :class_name
      t.integer :parent_id

      t.timestamps
    end
  end
end
