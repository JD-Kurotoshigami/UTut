class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:session][:username].downcase)
  	if user && user.authenticate(params[:session][:password])
  		#login
  	else
  		#error
  		flash.now[:danger] = 'Invalid Username/password combination'
  		render 'new'
  	end
  end

  def destroy
  end
end