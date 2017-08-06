class CreateActionsHierarchies < ActiveRecord::Migration[5.1]
  def change
    create_table :actions_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :actions_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "actions_anc_desc_idx"

    add_index :actions_hierarchies, [:descendant_id],
      name: "actions_desc_idx"
  end
end
