class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    review = Review.new(review_params)
    review.user_id = session[:user_id]
    review.product_id = params[:product_id]
    if review.save
       redirect_to "/products/#{params[:product_id]}"
     else
      redirect_to "/"
    end
  end

  def destroy
    @delete = Review.find(params[:id]).destroy
    redirect_to "/"
  end




  private
    def review_params
        params.require(:review).permit(:rating, :description)
    end
  end
