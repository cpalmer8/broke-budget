require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  test "is decimal" do
    expense = Expense.new(amount: 125.10)
    assert true
  end
end
