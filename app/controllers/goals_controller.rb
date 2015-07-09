class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  helper_method :goals_contribution
  helper_method :goals_projection
  # GET /goals
  # GET /goals.json
  def index
    if logged_in?
      @goals = Goal.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
    else
      redirect_to :login
    end
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id if current_user
    @goal.weekly_contribution = goals_calc(@goal.complete_date, Date.today, @goal.amount)
    @goals = Goal.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      if @goal.save
        @goals = Goal.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @goal }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      @goals = Goal.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:name, :amount, :complete_date)
    end

    #Calculating expected contribution for goals
    def goals_contribution(id)
      goal = Goal.find(id)
      complete_date = goal.complete_date
      initial_date = goal.created_at.to_date
      days_to_complete = (complete_date - initial_date).to_i
      weeks_to_complete = days_to_complete/7
      projected_weekly_contribution = goal.amount/weeks_to_complete
      return projected_weekly_contribution.round(2)
    end

    def goals_calc(complete_date, initial_date, amount)
      created_date = initial_date
      days_to_complete = (complete_date - created_date).to_i
      weeks_to_complete = days_to_complete/7
      projected_weekly_contribution = amount/weeks_to_complete
      puts projected_weekly_contribution
      return projected_weekly_contribution.round(2)
    end 
    
    def goals_projection(id)
      goal = Goal.find(id)
      complete_date = goal.complete_date
      initial_date = goal.created_at.to_date
      days_to_complete = (complete_date - initial_date).to_i
      weeks_to_complete = days_to_complete/7
      existing_contributions = Expense.where(:goal_id => id).sum("amount")
      remaining_total = goal.amount - existing_contributions
      remaining_time = ((complete_date - Date.today).to_i)/7
      projected_finish = remaining_total/remaining_time
      return projected_finish.round(2)
    end
end
