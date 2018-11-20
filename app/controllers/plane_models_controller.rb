class PlaneModelsController < ApplicationController
  before_action :set_plane_model, only: [:show, :edit, :update, :destroy]

  # GET /plane_models
  # GET /plane_models.json
  def index
    @plane_models = PlaneModel.all
  end

  # GET /plane_models/1
  # GET /plane_models/1.json
  def show
  end

  # GET /plane_models/new
  def new
    @plane_model = PlaneModel.new
  end

  # GET /plane_models/1/edit
  def edit
  end

  # POST /plane_models
  # POST /plane_models.json
  def create
    @plane_model = PlaneModel.new(plane_model_params)

    respond_to do |format|
      if @plane_model.save
        format.html { redirect_to @plane_model, notice: 'Plane model was successfully created.' }
        format.json { render :show, status: :created, location: @plane_model }
      else
        format.html { render :new }
        format.json { render json: @plane_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plane_models/1
  # PATCH/PUT /plane_models/1.json
  def update
    respond_to do |format|
      if @plane_model.update(plane_model_params)
        format.html { redirect_to @plane_model, notice: 'Plane model was successfully updated.' }
        format.json { render :show, status: :ok, location: @plane_model }
      else
        format.html { render :edit }
        format.json { render json: @plane_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plane_models/1
  # DELETE /plane_models/1.json
  def destroy
    @plane_model.destroy
    respond_to do |format|
      format.html { redirect_to plane_models_url, notice: 'Plane model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plane_model
      @plane_model = PlaneModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plane_model_params
      params.require(:plane_model).permit(:name, :range, :avg_speed, :max_pas, :fuel_use, :cost, :maintanence, :pilots, :hosts)
    end
end
