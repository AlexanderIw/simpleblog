module ApplicationHelper
    #helper method that is global to the whole application
	def full_title(page_title)
		base_title = "Lonique Alexander's"
		ending_title="New York, NY Computer Scientist"
		if page_title.empty?
		base_title
		else
		"#{base_title} #{page_title} | #{ending_title}"
		end
	end
end
