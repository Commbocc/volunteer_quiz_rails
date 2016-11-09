$ ->

	# highlight selected answers
	toggle_lgis = ->
		$('.radio-answer').each ->
			$parent_lgi = $(this).closest('.list-group-item')
			if $(this).is(':checked')
				$parent_lgi.addClass('list-group-item-info')
			else
				$parent_lgi.removeClass('list-group-item-info')
			return

	$('.radio-answer').change ->
		toggle_lgis()
		return

	$("#new_quiz [type='reset']").click (e) ->
		e.preventDefault()
		$(this).closest('form').get(0).reset()
		toggle_lgis()
		return
