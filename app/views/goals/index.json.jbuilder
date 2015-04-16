json.array!(@goals) do |goal|
  json.extract! goal, :id, :name, :amount, :complete_date
  json.url goal_url(goal, format: :json)
end
