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

#    Segismundo, Julio: Jan 30, 2018: Initial Code 
#    Segismundo, Julio: Feb 2, 2018: Fixed restrictions on user parameters such as:
#                             regular expression for valid first and last names
#                             disabled uniqueness of first and last names
#    Segismundo, Julio: Feb 7, 2018: Changed maximum length of username, firstname, and lastname
#                                 modified error message for invalid password due to length

class User < ApplicationRecord
     # username is saved as lowercase
     # username can only be of letters and underscores and must be unique
     # username, firstname, lastname maximum of 64 characters
     # sex must have a value
     # password is secure
     # password minimum of 5 characters

     before_save { self.username = username.downcase }
     VALID_USERNAME_REGEX = /\A(\w)+\z/i
     VALID_REALNAME_REGEX = /\A([a-zA-Z]([a-zA-Z\ \-])*[^ \d\-])\Z/i
     validates :username, length: { maximum: 64 }, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }
     validates :firstname, length: { maximum: 64 }, format: { with: VALID_REALNAME_REGEX }
     validates :lastname, length: { maximum: 64 }, format: { with: VALID_REALNAME_REGEX }
     validates :sex, presence: true
     has_secure_password
     validates :password, length: { minimum: 5, message: "is too short" }
#validates_with PasswordValidator, fields: [:password]
end

