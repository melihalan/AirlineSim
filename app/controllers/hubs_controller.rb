class HubsController < ApplicationController
  before_action :set_hub, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /hubs
  # GET /hubs.json
  def index
    @hubs = Hub.all
  end

  # GET /hubs/1
  # GET /hubs/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /hubs/new
  def new
    @hub = Hub.new
    @user_id = current_user.id
    @city_id = params[:city_id].to_i
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /hubs/1/edit
  def edit
    @user_id = current_user.id
    @city_id = params[:city_id].to_i
    respond_to do |format|
      format.js
    end
  end

  # POST /hubs
  # POST /hubs.json
  def create
    @hub = Hub.new(hub_params)
    @hub.user_id = current_user.id
    @hub.slots = 25
    @hub.rental_cost = @hub.population/2000*@hub.slots
    @hub.office_cost = @hub.staffs.count*4000
    respond_to do |format|
      if @hub.save
        format.html { redirect_to @hub, notice: 'Hub was successfully created.' }
        format.json { render :show, status: :created, location: @hub }
      else
        #format.html { render :new }
        #format.json { render json: @hub.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /hubs/1
  # PATCH/PUT /hubs/1.json
  def update
    @hub.rental_cost = @hub.population/2000*@hub.slots
    @hub.office_cost = @hub.staffs.count*4000
    respond_to do |format|
      if @hub.update(hub_params)
        @hub.postupdate
        format.html { redirect_to @hub, notice: 'Hub was successfully updated.' }
        format.json { render :show, status: :ok, location: @hub }
      else
        format.html { render :edit }
        format.json { render json: @hub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hubs/1
  # DELETE /hubs/1.json
  def destroy
    @hub.postdestroy
    @hub.destroy
    respond_to do |format|
      format.html { redirect_to hubs_url, notice: 'Hub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hub
      @hub = Hub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hub_params
      params.permit(:id, :city_id, :opening_cost, :rental_cost, :office_cost, :user_id, :slots)
    end
end
