class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.references :job, foreign_key: true
      t.text :result
      t.text :status

      t.timestamps
    end
  end
end
