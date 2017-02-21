module SessionsHelper

	#Logs the user in 
	def log_in(user)
		session[:user_id] = user.id
	end

	# Returns the current logged in user if there is one
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out(user)
		session.delete(:user_id)
		@current_user = nil
	end

	def logged_out?
		current_user.nil?
	end

end

