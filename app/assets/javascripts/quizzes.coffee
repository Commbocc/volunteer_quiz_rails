$ ->

	# on radio change
	$('.radio-answer').change ->
		toggle_lgis()
		show_questions()
		reset_submit_button()
		return

	# reset_submit_button
	reset_submit_button = ->
		$('#submit-quiz-btn').show()
		$('#modal-share-btn').hide()
		$('#modal-donate-btn').hide()

	# highlight selected answers
	toggle_lgis = ->
		$('.radio-answer').each ->
			$parent_lgi = $(this).closest('.list-group-item')
			if $(this).is(':checked')
				$parent_lgi.addClass('list-group-item-info')
			else
				$parent_lgi.removeClass('list-group-item-info')
			return

	$("#new_quiz [type='reset']").click (e) ->
		e.preventDefault()
		$(this).closest('form').get(0).reset()
		toggle_lgis()
		show_questions()
		reset_submit_button()
		return

	# hide other questions when only "share this quiz" from Question 1 is selected
	hide_questions = (exceptions=[]) ->
		$('.quiz-question').not(exceptions).hide()
		return

	show_questions = () ->
		$('.radio-answer').each ->
			$parent_question = $(this).closest('.quiz-question')
			$parent_question.show()
			return
		return

	$('.radio-answer[data-hide-questions="true"]').change ->
		if $(this).is(':checked')
			$except = $(this).closest('.quiz-question')
			hide_questions($except)
			$('#submit-quiz-btn').hide()
			$('#modal-share-btn').show()
		return

	$('.radio-answer[data-show-donate-btn="true"]').change ->
		if $(this).is(':checked')
			$except = $(this).closest('.quiz-question')
			hide_questions($except)
			$('#submit-quiz-btn').hide()
			$('#modal-share-btn').hide()
			$('#modal-donate-btn').show()
		return
