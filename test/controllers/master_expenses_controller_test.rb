require 'test_helper'

class MasterExpensesControllerTest < ActionController::TestCase
  setup do
    @master_expense = master_expenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:master_expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create master_expense" do
    assert_difference('MasterExpense.count') do
      post :create, master_expense: { amount: @master_expense.amount, category: @master_expense.category, mandatory: @master_expense.mandatory }
    end

    assert_redirected_to master_expense_path(assigns(:master_expense))
  end

  test "should show master_expense" do
    get :show, id: @master_expense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @master_expense
    assert_response :success
  end

  test "should update master_expense" do
    patch :update, id: @master_expense, master_expense: { amount: @master_expense.amount, category: @master_expense.category, mandatory: @master_expense.mandatory }
    assert_redirected_to master_expense_path(assigns(:master_expense))
  end

  test "should destroy master_expense" do
    assert_difference('MasterExpense.count', -1) do
      delete :destroy, id: @master_expense
    end

    assert_redirected_to master_expenses_path
  end
end
