class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.text :vector, array: true, default: []
      t.integer :expected

      t.timestamps
    end
  end
end
