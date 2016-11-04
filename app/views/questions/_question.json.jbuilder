json.extract! question, :content
json.answers do
	json.array! question.answers, partial: 'answers/answer', as: :answer
end
# json.url question_url(question, format: :json)
