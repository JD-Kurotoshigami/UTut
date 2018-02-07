class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:session][:username].downcase)
  	if user && user.authenticate(params[:session][:password])
  		#login
  		log_in user
  		redirect_to user
 		params[:session][:message] = nil
  	else
  		#error
  		flash.now[:danger] = 'Invalid Username/password combination'
  		render 'loginerror'
  	end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end