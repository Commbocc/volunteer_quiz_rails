module Sortable

	def sort
		puts "sorting #{params[:controller]}"
		@klass = params[:controller].classify.constantize
		sortables = @klass.where(id: params[:sortee])
		params[:sortee].each_with_index do |id, index|
			# sortables.update_all({position: index+1}, {id: id})
			sortables.update(id, position: index+1)
		end
	end

end
