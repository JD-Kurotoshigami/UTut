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

# Mendoza JD: Feb 1, 2018: Initial Code and allows user login and logout
# Mendoza JD: Feb 6, 2018: Added a feature that displays a notification about incorrect login credentials
# Mendoza JD: Feb 13, 2018: Error Handling now determines the type of error

# File Created: Feb 1, 2018
# Mendoza JD
# Serves as a controller for sessions related functionalities

class SessionsController < ApplicationController

     # Create
     # Feb 1 2018
     # Attempts to log in a user
     def create
          #The user to log in
          user = User.find_by(username: params[:session][:username].downcase) 
          if user
               #User Exists
               if user.authenticate(params[:session][:password])
                    # Log In Success
                    log_in user
                    redirect_to user
               else
                    #Incorrect Password
                    error_type "Incorrect Password"
                    render 'login'
               end
          else
               #User does not exist
               error_type "User does not exist"
               render 'login'
          end
     end

     # Destroy
     # Feb 1 2018
     # Logs out the user and redirects to the home page
     def destroy
          log_out
          redirect_to root_url
     end    
end