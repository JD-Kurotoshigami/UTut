class ReviewsController < ApplicationController
     def index
          redirect_to 'new'
     end

     def show
          @user = User.find(params[:user_id])
     end

     def new
          @user = User.find(params[:user_id])
     end

     def create
          @user = User.find(params[:user_id])
          rev = @user.reviews.create(review_params)
          if rev
               rev.reviewer_id = current_user.id
               rev.save
               redirect_to @user, notice: 'Review has been added'
          else
               redirect_to @user, alert: 'Error adding review'
          end
     end

     private

     def review_params
          params.require(:review).permit(:body, :rating, :subject)
     end

end
