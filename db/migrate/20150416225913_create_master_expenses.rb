class CreateMasterExpenses < ActiveRecord::Migration
  def change
    create_table :master_expenses do |t|
      t.decimal :amount
      t.string :category
      t.integer :mandatory

      t.timestamps
    end
  end
end
