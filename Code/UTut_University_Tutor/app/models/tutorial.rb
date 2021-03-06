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

#    Jules Segismundo: Feb 27, 2018: Initial Code
class Tutorial < ApplicationRecord
     # makes subject uppercase and removes all whitespaces
     # ? DAPAT BA MAY DATABASE OF SUBJECTS PARA HINDI MAGULO? 
     # makes sure that a tutorial has a subject
     before_save { self.subject = self.subject.upcase().gsub(/\s+/, "") }
     VALID_SUBJECT_REGEX = /\A([A-Z]+(\ )?[0-9]+(.[0-9]+)?)\Z/i
     validates :subject, presence: true, format: { with: VALID_SUBJECT_REGEX }
     validates :tutor_id, presence: true
     validates :start_hr, presence: true
     validates :end_hr, presence: true
     validates :day, presence: true
     validates :start_min, presence: true
     validates :end_min, presence: true
     validate :start_min_before_end_min
     validate :start_hr_before_end_hr
 
     private
          def start_min_before_end_min
               if start_hr == end_hr
                    errors.add(:start_min, "must be before end min") unless
                         start_min < end_min
               end
          end

          def start_hr_before_end_hr
               errors.add(:start_hr, "must be before end hr") unless 
                    start_hr <= end_hr          
          end
end
