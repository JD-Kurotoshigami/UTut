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

# JD Mendoza, Feb 14, 2018, Added User Information Getters

# File Created: Feb 1, 2018 (?)
# Segismundo Jules
# Serves as a helper for user related functionalities

module UsersHelper
     class PasswordValidator < ActiveModel::Validator
          def validate(record)
               if record.length < 5
                    record.errors[:base] << "len < 5"
               end
          end

     end

     # get_sid
     # Feb 14 2018
     # gets the user's student id
     # user - the user to get the sid from
     def get_sid(user)
          user.username
     end

     # get_full_name
     # Feb 14 2018
     # gets the user's full name
     # user - the user to get the name from
     def get_full_name(user)
          user.lastname + ", " + user.firstname
     end

     # get_sex
     # Feb 14 2018
     # gets the user's sex
     # user - the user to get the ssex from
     def get_sex(user)
          user.sex
     end

     # get_description
     # Feb 14 2018
     # gets the user's profile description
     # user - the user to get the description from
     def get_description(user)
          if user.description == nil
               "No Description"
          else
               user.description
          end
     end

     # Jules do your shit here to get the password
     def get_password(user)
          nil 
     end
end
