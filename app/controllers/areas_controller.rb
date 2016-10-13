class AreasController < ApplicationController

  def index
    if params[:search].present?
      @areas = Area.near(params[:search], 50)
    else
      @areas = Area.all
    end

    respond_to do |format|
      format.json {render :json => @areas}
      format.html {}
    end
  end

  def show
    @area = Area.find params[:id]
    @review = Review.new
    #
    # if params[:area][:images].present?
    #     params[:area][:images].each do |photo|
    #       req = Cloudinary::Uploader.upload(photo)
    #       area.images << req['public_id']
    #       area.save
    #     end
    # end
  end

  def new
    if current_user
      @area = Area.new
    else
      redirect_to login_path
    end

  end

  def create

    @area = Area.new(area_params)
    @area.user_id = current_user.id
    @area.facility_ids = params[:area][:facility_ids]
    @area.terrain_ids = params[:area][:terrain_ids]
    @area.open_at_all_times = params[:open_at_all_times]

    if @area.open_at_all_times == false
      if params[:open_two].present? && params[:close_two].present? && params[:open_two] != "false" && params[:close_two] != "false"
        @area.open_times = "#{params[:open_one]} to #{params[:close_one]}, #{params[:open_two]} to #{params[:close_two]}"
      else
        @area.open_times = "#{params[:open_one]} to #{params[:close_one]}"
      end

    end

    respond_to do |format|
      if @area.save(area_params)
        format.html { redirect_to @area}
        format.json { render json: @area, status: :ok, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @area = Area.find params[:id]
  end

  def update
    @area = Area.find params[:id]

    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to @area}
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
    params.require(:area).permit(:name, :open_times, :prohibited, :description, :image, :address, :info_link, :size, :user_id, :facility_ids => [], :terrain_ids => [] )
  end
end
