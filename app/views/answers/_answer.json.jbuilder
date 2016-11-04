json.extract! answer, :content
json.weights do
	json.array! answer.opportunity_weights, :opportunity_id, :weight
end
# json.url answer_url(answer, format: :json)
