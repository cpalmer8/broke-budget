class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :amount
      t.integer :masterexpenses_id
      t.string :notes
      t.integer :goal_id
      t.integer :one_time

      t.timestamps
    end
  end
end
