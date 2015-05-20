class MasterExpense < ActiveRecord::Base
  belongs_to :user
  validates :amount, presence: true
  validates :category, presence: true
  validates :mandatory, presence: true
end
