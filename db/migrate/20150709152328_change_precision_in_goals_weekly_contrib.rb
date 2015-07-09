class ChangePrecisionInGoalsWeeklyContrib < ActiveRecord::Migration
  def change
    change_column :goals, :weekly_contribution, :decimal
  end
end
