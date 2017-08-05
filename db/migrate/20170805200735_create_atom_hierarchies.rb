class CreateAtomHierarchies < ActiveRecord::Migration[5.1]
  def change
    create_table :atom_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :atom_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "atom_anc_desc_idx"

    add_index :atom_hierarchies, [:descendant_id],
      name: "atom_desc_idx"
  end
end
