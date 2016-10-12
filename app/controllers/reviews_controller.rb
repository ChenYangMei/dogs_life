class ReviewsController < ApplicationController
  before_action :authorise, :only => [:create, :destroy]
  before_action :check_user, :only => [:edit, :update, :destroy]

  def create
    @area = Area.find params[:area_id]
    @review = Review.create(review_params)
    @area.reviews << review
    @current_user.reviews << review

    if @Review.save(review_params)
      render json: @Review
    else
      render json: @Review.errors
    end
  end

  def edit
    @area = Area.find params[:area_id]
    @review = @area.reviews.find params[:id]
  end

  def update
    review = Review.find params[:id]
    review.update review_params

    if @Review.save(review_params)
      render json: @Review
    else
      render json: @Review.errors
    end

  end

  def destroy
    @area = Area.find params[:area_id]
    @review = @area.reviews.find params[:id]
    @review.destroy
    redirect_to area_path(@area)
  end

  private
    def review_params
      params.require(:review).permit(:score, :body, :area_id, :user_id)
    end

    def check_user
      if current_user.id != Review.find(params[:id]).user.id
       flash[:error] = "That's not your account"
       redirect_to :back
      end
    end
end
