class PlanesController < ApplicationController
  before_action :set_plane, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /planes
  # GET /planes.json
  def index
    @planes = Plane.all
  end

  # GET /planes/1
  # GET /planes/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /planes/new
  def new
    @plane = Plane.new
    @user_id = current_user.id
    @plane_model_id = params[:plane_model_id].to_i
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /planes/1/edit
  def edit
    @user_id = current_user.id
    @seat_configuration_id = params[:seat_configuration_id].to_i
    respond_to do |format|
      format.js
    end
  end

  # POST /planes
  # POST /planes.json
  def create
    @plane = Plane.new(plane_params)
    @plane.user_id = current_user.id
    respond_to do |format|
      if @plane.save
        format.html { redirect_to @plane, notice: 'Plane was successfully created.' }
        format.json { render :show, status: :created, location: @plane }
      else
        format.html { render :new }
        format.json { render json: @plane.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planes/1
  # PATCH/PUT /planes/1.json
  def update
    respond_to do |format|
      if @plane.update(plane_params)
        @plane.postupdate
        format.html { redirect_to @plane, notice: 'Plane was successfully updated.' }
        format.json { render :show, status: :ok, location: @plane }
      else
        format.html { render :edit }
        format.json { render json: @plane.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planes/1
  # DELETE /planes/1.json
  def destroy
    @plane.postdestroy
    @plane.destroy
    respond_to do |format|
      format.html { redirect_to planes_url, notice: 'Plane was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plane
      @plane = Plane.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plane_params
      params.require(:plane).permit(:plane_model_id, :xroute_id, staff_ids: [])
    end
end
