class SessionsController < ApplicationController
  def new
  end

  def destroy 
    log_out
    redirect_to root_url
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		#Log the person in and redirect them to their webpage
  		log_in user
  		#Rails automatically converts redirect_to user to the route user_url(user)
  		redirect_to user
  	else
  		flash.now[:danger] = 'invalid email/password combination'
  		render 'new'
  	end 
  end

end
