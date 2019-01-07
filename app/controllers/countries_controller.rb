class CountriesController < ApplicationController
  def index
    @list = Country.where(territory_id: params[:territory_id])
    respond_to do |format|
      format.html { redirect_to @list}
      format.js
    end
  end
end
