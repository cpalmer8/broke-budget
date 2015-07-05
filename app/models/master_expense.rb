class MasterExpense < ActiveRecord::Base
  belongs_to :user
  has_many :expenses
  validates :amount, presence: true
  validates :category, presence: true
  validates :mandatory, presence: true
end
