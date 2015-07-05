class ChangeMasterExpenseColumn < ActiveRecord::Migration
  def change
    rename_column :expenses, :masterexpenses_id, :master_expense_id
  end
end
