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
          params = session[:search_params]
          days = []
          if (params["Mon"].to_i + params["Tue"].to_i + params["Wed"].to_i + params["Thu"].to_i + params["Fri"].to_i + params["Sat"].to_i + params["Sun"].to_i) <= 0
               params["Mon"] = '1'
               params["Tue"] = '1'
               params["Wed"] = '1'
               params["Thu"] = '1'
               params["Fri"] = '1'
               params["Sat"] = '1'
               params["Sun"] = '1'
          end
          days = ["Mon"*params["Mon"].to_i,"Tue"*params["Tue"].to_i,"Wed"*params["Wed"].to_i,"Thu"*params["Thu"].to_i,"Fri"*params["Fri"].to_i,"Sat"*params["Sat"].to_i,"Sun"*params["Sun"].to_i]

<<<<<<< HEAD
          res = Tutorial.where("(subject like ?) AND (day IN (?)) AND ((start_hr*100)+start_min >= ?) AND ((end_hr*100)+end_min <= ?) AND NOT (tutor_id == ?)", 
               "%"+params[:subject].upcase.gsub(/\s+/, "")+"%", 
               days, 
               (params[:start_hr].to_i*100)+params[:start_min].to_i, 
               (params[:end_hr].to_i*100)+params[:end_min].to_i, 
               current_user.id).order(:subject)
=======
          res = Tutorial.where("(subject like ?) AND (day IN (?)) AND ((start_hr*100)+start_min >= ?) AND ((end_hr*100)+end_min <= ?)", "%"+params[:subject].upcase.gsub(/\s+/, "")+"%", days , (params[:start_hr].to_i*100)+params[:start_min].to_i, (params[:end_hr].to_i*100)+params[:end_min].to_i).order(:subject)
>>>>>>> d4b636bd9f68e73de6c8d708ed2f98bab34a2416

          if (params[:start_hr].to_i*100)+params[:start_min].to_i >= (params[:end_hr].to_i*100)+params[:end_min].to_i
               search_error_type "Invalid Time Interval"
               redirect_to tutorial_search_path
          elsif res.size > 0
               session[:search_result] = res
               redirect_to tutorial_search_result_path
          else
               search_error_type "No Tutorial Offer that matches the conditions"
               redirect_to tutorial_search_path
          end
     end

     private

     def tutorial_params
          params.require(:tutorial).permit(:subject, :start_hr, :end_hr, :start_min, :end_min, :day)
     end

end
