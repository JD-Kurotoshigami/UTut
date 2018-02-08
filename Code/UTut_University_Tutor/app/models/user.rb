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

# class PasswordValidator < ActiveModel::Validator
#   def validate(record)
#     if record.password == nil || record.password[:length] < 5
#       record.errors[:base] << "len < 5"
#     end
#   end
# end
class User < ApplicationRecord
     before_save { self.username = username.downcase }
     VALID_USERNAME_REGEX = /\A(\w)+\z/i
     VALID_REALNAME_REGEX = /\A([a-zA-Z]([a-zA-Z\ \-])*[^ \d\-])\Z/i
     validates :username, length: { maximum: 64 },
                       format: { with: VALID_USERNAME_REGEX },
                       uniqueness: { case_sensitive: false }
     validates :firstname, length: { maximum: 64 },
                       format: { with: VALID_REALNAME_REGEX }
     validates :lastname, length: { maximum: 64 },
                       format: { with: VALID_REALNAME_REGEX }
     validates :sex, presence: true
     has_secure_password
     validates :password, length: { minimum: 5, message: "is too short" }
     #validates_with PasswordValidator, fields: [:password]
end

