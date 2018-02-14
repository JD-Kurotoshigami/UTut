# UTut: University Tutor
#    Copyright (C) 2018  
#    Mendoza, John Dominic
#    Segismundo, Julio 
#    De Guzman, Nicole Jade            
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#    This is a course requirement for CS 192
#    Software Engineering II under the
#    supervision of Asst. Prof. Ma. Rowena C.
#    Solamo of the Department of Computer
#    Science, College of Engineering, University
#    of the Philippines, Diliman for the AY 2017-2018

#    File created: Jan 30, 2018
#    Segismundo, Julio
#    Serves as a controller for user account related functionalities


class UsersController < ApplicationController

     # Index
     # Feb 7, 2018
     # Redirects user to home page if url /users is accessed since the page does not exist.
     def index
          redirect_to root_url
     end

     # Show
     # Jan 30, 2018
     # Shows the user's profile when accessed
     # Feb 7, 2018
     # Redirects user to home page if profile does not exist.
     def show
          if User.exists?(params[:id])
               @user = User.find(params[:id])
               render 'new'
          else
               redirect_to root_url
          end
     end

     # New
     # Jan 30, 2018
     # Allows sign up functionality
     # Feb 7, 2018
     # Redirects user to home page if already logged in
     def new
          if logged_in?
               redirect_to root_url
          else
               @user = User.new
          end
     end
     
     # Create
     # Jan 30, 2018
     # Creates a new user and saves it to the database. User is redirected to their profile
     # A failure in sign up would render the same page.
     def create
          @user = User.new(user_params)
          if @user.save
               log_in @user
               redirect_to @user
          else
               render 'new'
          end
     end

     private

     # User_Params
     # Jan 30, 2018
     # Parameters passed when creating a new user
     def user_params
          params.require(:user).permit(:username, :firstname, :lastname, :sex, :password, :password_confirmation)
     end
end
