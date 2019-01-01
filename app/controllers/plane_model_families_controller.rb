class PlaneModelFamiliesController < ApplicationController
  def filter
    @list = PlaneModelFamily.where(plane_manufacturer_id: params[:plane_manufacturer_id])
    respond_to do |format|
      format.html {redirect_to @list}
      format.js
    end
  end
end
