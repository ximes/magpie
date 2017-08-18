class CreateRulesHierarchies < ActiveRecord::Migration[5.1]
  def change
    create_table :rule_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :rule_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "rule_anc_desc_idx"

    add_index :rule_hierarchies, [:descendant_id],
      name: "rule_desc_idx"
  end
end
