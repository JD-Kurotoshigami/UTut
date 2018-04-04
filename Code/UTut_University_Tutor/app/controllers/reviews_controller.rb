class ReviewsController < ApplicationController

     def create
          @user = User.find(params[:user_id])

          if @user.reviews.create(review_params)
               redirect_to @user, notice: 'Review has been added'
          else
               redirect_to @user, alert: 'Error adding review'
          end
     end

     private

     def review_params
          params.require(:review).permit(:body, :rating)
     end

end
