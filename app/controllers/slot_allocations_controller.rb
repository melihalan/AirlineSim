class SlotAllocationsController < ApplicationController
  before_action :set_slots_allocation, only: [:update]

  def create
    @slots_allocation = SlotsAllocation.new(slots_allocation_params)
  end

  def destroy
    @slots_allocation.destroy
  end


  private

  def set_slots_allocation
    @slots_allocation = SlotsAllocation.find(params[:id])
  end

  def slots_allocation_params
    params.permit(:user_id, :city_id, :slots, :used_slots)
  end
end
