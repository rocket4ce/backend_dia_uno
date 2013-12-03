module ApplicationHelper
	def get_oauth_username
		if session[:facebook_data]
			session[:facebook_data][:username]
		else
			""
		end
	end
end
	