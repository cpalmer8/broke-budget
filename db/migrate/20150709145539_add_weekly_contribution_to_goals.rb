class AddWeeklyContributionToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :weekly_contribution, :decimal, :precision => 2
  end
end
