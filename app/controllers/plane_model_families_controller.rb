class PlaneModelFamiliesController < ApplicationController
  def index
    @list = PlaneModelFamily.where(plane_manufacturer_id: params[:plane_manufacturer_id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
