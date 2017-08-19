class AddResultToScore < ActiveRecord::Migration[5.1]
  def change
    add_column :scores, :result, :integer
  end
end
