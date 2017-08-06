class CreateRulesHierarchies < ActiveRecord::Migration[5.1]
  def change
    create_table :rules_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :rules_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "rules_anc_desc_idx"

    add_index :rules_hierarchies, [:descendant_id],
      name: "rules_desc_idx"
  end
end
