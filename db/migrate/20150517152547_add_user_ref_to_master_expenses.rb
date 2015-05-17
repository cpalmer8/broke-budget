class AddUserRefToMasterExpenses < ActiveRecord::Migration
  def change
    add_reference :master_expenses, :user, index: true
  end
end
