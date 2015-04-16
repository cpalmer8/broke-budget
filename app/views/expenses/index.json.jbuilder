json.array!(@expenses) do |expense|
  json.extract! expense, :id, :amount, :masterexpenses_id, :notes, :goal_id, :one_time
  json.url expense_url(expense, format: :json)
end
