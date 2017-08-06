class AddParentIdToRules < ActiveRecord::Migration[5.1]
  def change
    add_column :rules, :parent_id, :integer
  end
end
