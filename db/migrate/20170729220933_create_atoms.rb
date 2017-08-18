class CreateAtoms < ActiveRecord::Migration[5.1]
  def change
    create_table :atoms do |t|
      t.string :name
      t.boolean :enabled
      t.string :class_name

      t.timestamps
    end
  end
end
