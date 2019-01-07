class CountriesController < ApplicationController
  def index
    @list = Country.where(territory_id: params[:territory_id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
