class AreasController < ApplicationController
  def index
    @areas = Area.all
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    @area.user_id = @current_user.id

    # if params[:area][:images].present?
    #     params[:area][:images].each do |photo|
    #       req = Cloudinary::Uploader.upload(photo)
    #       area.images << req['public_id']
    #       area.save
    #     end
    # end

    respond_to do |format|
      if @area.save(area_params)
        format.html { redirect_to @area, notice: 'Area was successfully updated.' }
        format.json { render json: @area, status: :ok, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
    redirect_to area_path(area)
  end

  def edit
    @area = Area.find params[:id]
  end

  def update
    @area = Area.find params[:id]

    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to @area, notice: 'Area was successfully updated.' }
        format.json { render json: @area, status: :ok, location: @area }
      else
        format.html { render :edit }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    area = Area.find params[:id]
    area.destroy
    redirect_to areas_path
  end

  private

  def area_params
    params.require(:area).permit(:name, :open_times, :prohibited, :description, :image, :address, :info_link, :size, :user_id )
  end
end
