json.array!(@master_expenses) do |master_expense|
  json.extract! master_expense, :id, :amount, :category, :mandatory
  json.url master_expense_url(master_expense, format: :json)
end
