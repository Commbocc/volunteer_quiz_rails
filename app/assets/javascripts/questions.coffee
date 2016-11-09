# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	tableWidthHelper = (e, ui) ->
		ui.children().each ->
			$(this).width $(this).width()
			$(this).height $(this).height()
			return
		ui

	$('#questions').sortable
		items: "> tr"
		helper: tableWidthHelper
		placeholder: '.table tr'
		axis: 'y'
		# handle: '.handle'
		update: ->
			$.post $(this).data('sort'), $(this).sortable('serialize')

	$('#questions ul.answers').sortable
		items: "li"
		placeholder: 'li'
		axis: 'y'
		# handle: '.handle'
		update: ->
			$.post $(this).data('sort'), $(this).sortable('serialize')
