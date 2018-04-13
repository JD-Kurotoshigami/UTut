class ReviewsController < ApplicationController

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
          params.require(:review).permit(:body, :rating)
     end

end
