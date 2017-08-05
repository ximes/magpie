class MergeActionRuleIntoAtoms < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:jobs_rules, :rule, index: true)
    remove_reference(:jobs_actions, :action, index: true)

    drop_table :actions
    rename_table :rules, :atoms

    add_reference(:jobs_rules, :atom, index: true)
    add_reference(:jobs_actions, :atom, index: true)
  end
end
