class RunningCostsController < ApplicationController
  before_action :set_running_cost, only: [:update]

  def create
    @running_cost = RunningCost.new(running_cost_params)
    self.book_id = Book.find_by(user_id: current_user).id
  end

  def destroy
    @running_cost.destroy
  end

  private

  def set_running_cost
    @running_cost = RunningCost.find(params[:id])
  end


  def running_cost_params
    params.permit(:book_id, :category, :value, :description)
  end

end
