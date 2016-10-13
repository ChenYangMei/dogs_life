class ImagesController < ApplicationController
  before_action :authorise, :only => [:create, :destroy]
  # before_action :check_user, :only => [:edit, :update, :destroy]

  def create
    @area = Area.find params[:area_id]
    @image = Image.new({
      :public_id => params["response"]["public_id"],
      :url => params["response"]["secure_url"]
    })

    if @image.save
      @area.images << @image
      current_user.images << @image
      @response = @image.to_json(:include => :user)
      render json: @response
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  def index
    @area = Area.find(params[:area_id])
    @images = @area.images
    render :json => {images: @images}
  end

  def destroy
    @area = Area.find params[:area_id]
    @image = @area.images.find params[:id]
    @image.destroy
    redirect_to area_path(@area)
  end

  private
    def image_params
      binding.pry
      params.require(:image).permit(:public_id, :url, :user_id, :area_id)
    end

    def authorise
      flash[:error] = "Please log in first!" unless current_user.present?

      redirect_to login_path unless current_user.present?
    end

    # def check_user
    #   if current_user.id != Image.find(params[:id]).user.id
    #    flash[:error] = "That's not your account"
    #    redirect_to :back
    #   end
    # end
end
