module ApplicationHelper
	def title(*parts)
		unless parts.empty?
			content_for :title do
				(parts << "My BaseCamp").join(" - ")
			end
		end
	end
end
