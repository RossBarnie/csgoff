module ApplicationHelper

	def full_title(sub)
		title = "CS:GO Friend Finder"
		if sub.empty?
			title
		else
			"#{title} | #{sub}"
		end
	end
end
