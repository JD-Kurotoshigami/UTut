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

include TutorialHelper

class TutorialController < ApplicationController
     def new
          @tutorial = Tutorial.new
     end

     def show
          render 'search'
     end

     def index
          
     end

     def create
          
          @tutorial = Tutorial.new(tutorial_params)
          @tutorial.tutor_id = current_user.id
          if @tutorial.save
               redirect_to root_url
          else
               render 'new'
          end
     end

     def tutorial_search
          set_search_params (params[:search])
          subject = session[:search_params][:subject].downcase
          if subject == "cs" 
               redirect_to root_url
          else 
               search_error_type "No Offer"
               redirect_to tutorial_search_result_path
          end
     end

     private

     def tutorial_params
          params.require(:tutorial).permit(:subject, :start_hr, :end_hr, :start_min, :end_min, :day)
     end

end
