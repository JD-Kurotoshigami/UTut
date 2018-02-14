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

# Mendoza JD: Feb 1, 2018: Initial Code and Added Functions for logging in and logging out. 
# Mendoza JD: Feb 13, 2018: Added Code for Error Setting

# File Created: Feb 1, 2018
# Mendoza JD
# Serves as a helper for sessions related functionalities

module SessionsHelper

     # Log_in
     # Feb 1 2018
     # Attempts to log in a user
     # User: The user to log in
     def log_in(user)
          session[:username] = user.username
          session[:error] = nil
     end

     # Current_User
     # Feb 1 2018
     # Returns the user currently logged in
     def current_user
          @current_user ||= User.find_by(username: session[:username])
     end

     # Current User?
     # Feb 14 2018
     # tests if the current user is the user
     def current_user?(user)
          user == @current_user
     end

     # Log_out
     # Feb 1 2018
     # Logs out the current user
     def log_out
          session.delete(:username)
          @current_user = nil
     end

     # Logged_in?
     # Feb 1 2018
     # Returns true if there is a logged in user, otherwise false
     def logged_in?
          !current_user.nil?
     end

     # Has_Error?
     # Feb 13 2018
     # Determines if there is an error logging in
     def has_error?
          !session[:error] .nil?
     end
     
     # Error_Type
     # Feb 13 2018
     # Sets the Error Type
     def error_type(err)
          session[:error]=err
     end
end
