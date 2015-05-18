class MasterExpensesController < ApplicationController
  before_action :set_master_expense, only: [:show, :edit, :update, :destroy]

  # GET /master_expenses
  # GET /master_expenses.json
  def index
    @master_expenses = MasterExpense.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
    @master_expense = MasterExpense.new
  end

  # GET /master_expenses/1
  # GET /master_expenses/1.json
  def show
  end

  # GET /master_expenses/new
  def new
    @master_expense = MasterExpense.new
  end

  # GET /master_expenses/1/edit
  def edit
  end

  # POST /master_expenses
  # POST /master_expenses.json
  def create
    @master_expense = MasterExpense.new(master_expense_params)
    @master_expense.user_id = current_user.id if current_user
    respond_to do |format|
      if @master_expense.save
        format.html { redirect_to @master_expense, notice: 'Master expense was successfully created.' }
        format.json { render action: 'show', status: :created, location: @master_expense }
        format.js   { render action: 'show', status: :created, location: @master_expense }
      else
        format.html { render action: 'new' }
        format.json { render json: @master_expense.errors, status: :unprocessable_entity }
        format.js   { render json: @master_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_expenses/1
  # PATCH/PUT /master_expenses/1.json
  def update
    respond_to do |format|
      if @master_expense.update(master_expense_params)
        format.html { redirect_to @master_expense, notice: 'Master expense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @master_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_expenses/1
  # DELETE /master_expenses/1.json
  def destroy
    @master_expense.destroy
    respond_to do |format|
      format.html { redirect_to master_expenses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_expense
      @master_expense = MasterExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def master_expense_params
      params.require(:master_expense).permit(:amount, :category, :mandatory)
    end
end
