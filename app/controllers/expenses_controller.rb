class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    if logged_in?
      @expenses = Expense.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
    else
      redirect_to :login
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id if current_user
    @expenses = Expense.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      if @expense.save
        @expenses = Expense.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render action: 'show', status: :created, location: @expense }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      @expenses = Expense.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:amount, :masterexpenses_id, :notes, :goal_id, :one_time)
    end
end
