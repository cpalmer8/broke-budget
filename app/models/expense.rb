class Expense < ActiveRecord::Base
  belongs_to :user
  belongs_to :master_expense
  belongs_to :goal
  validates :master_expense_id, presence: true
  validates :goal_id, presence: true
end
