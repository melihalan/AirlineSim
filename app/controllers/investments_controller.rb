class InvestmentsController < ApplicationController
  before_action :set_investment, only: [:update]

  def new
    @investment = Investment.new
  end

  def create
    @investment = Investment.new(investment_params)
    self.book_id = Book.find_by(user_id: current_user.id).id
    self.turn_id = Turn.last.id
  end

  def update
    @investment.update(investment_params)
  end

  private

  def set_investment
    @investment = Investment.find(params[:id])
  end

  def investment_params
    params.permit(:book_id, :turn_id, :category, :value, :description)
  end

end
