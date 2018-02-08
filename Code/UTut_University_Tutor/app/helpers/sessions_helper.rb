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

# Feb 1, 2018: Initial Code and Added Functions for logging in and logging out. 
module SessionsHelper

     # Logs in the given user by setting the session user as the user
     def log_in(user)
          session[:username] = user.username
     end
     # Returns the current user
     def current_user
          @current_user ||= User.find_by(username: session[:username])
     end

     # Logs out the current user by removing it from the session information
     def log_out
          session.delete(:username)
          @current_user = nil
     end

     # Returns true if there is a logged in user
     def logged_in?
          !current_user.nil?
     end
end
