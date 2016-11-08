module AnswersHelper

	def is_checked?(question, answer_id)
		checked = (params[:questions].present? ? params[:questions][question.id.to_s] : 0)
		checked == answer_id.to_s
	rescue
		false
	end

end
