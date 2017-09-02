class AddNestedSetToRules < ActiveRecord::Migration[5.1]
  def change
    add_column :rules, :parent_id, :integer
    add_column :rules, :lft, :integer, null: false, index: true
    add_column :rules, :rgt, :integer, null: false, index: true

    # optional fields
    add_column :rules, :depth, :integer, null: false, default: 0
    add_column :rules, :children_count, :integer, null: false, default: 0
  end
end
