class Expense < ActiveRecord::Base
  belongs_to :user
  belongs_to :master_expense
  belongs_to :goal
end
