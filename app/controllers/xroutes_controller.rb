class XroutesController < ApplicationController
  before_action :set_xroute, only: [:show, :edit, :update, :destroy]

  # GET /xroutes
  # GET /xroutes.json
  def index
    @xroutes = Xroute.all
  end

  # GET /xroutes/1
  # GET /xroutes/1.json
  def show
  end

  # GET /xroutes/new
  def new
    @xroute = Xroute.new
  end

  # GET /xroutes/1/edit
  def edit
  end

  # POST /xroutes
  # POST /xroutes.json
  def create
    @xroute = Xroute.new(xroute_params)

    respond_to do |format|
      if @xroute.save
        format.html { redirect_to @xroute, notice: 'Xroute was successfully created.' }
        format.json { render :show, status: :created, location: @xroute }
      else
        format.html { render :new }
        format.json { render json: @xroute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xroutes/1
  # PATCH/PUT /xroutes/1.json
  def update
    respond_to do |format|
      if @xroute.update(xroute_params)
        format.html { redirect_to @xroute, notice: 'Xroute was successfully updated.' }
        format.json { render :show, status: :ok, location: @xroute }
      else
        format.html { render :edit }
        format.json { render json: @xroute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xroutes/1
  # DELETE /xroutes/1.json
  def destroy
    @xroute.destroy
    respond_to do |format|
      format.html { redirect_to xroutes_url, notice: 'Xroute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xroute
      @xroute = Xroute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xroute_params
      params.require(:xroute).permit(:hub_id, :city_id, :distance, :max_num_pas, :operating_cost)
    end
end
