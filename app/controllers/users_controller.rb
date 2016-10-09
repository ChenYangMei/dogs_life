class UsersController < ApplicationController
  before_action :authorise, :only => [:index, :show, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    redirect_to root_path
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update(user_params)

    # if params[:file].present?
    #   req = Cloudinary::Uploader.upload(params[:file])
    #   user.image = req["public_id"]
    #   user.save
    # end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    user = User.find params[:id]
    user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :admin, :image)
  end

  def authorise
    flash[:error] = "You need to be logged in to see that" unless @current_user.present?
    redirect_to login_path unless @current_user.present?
  end
end
