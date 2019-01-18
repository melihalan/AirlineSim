class PlaneManufacturer < ApplicationRecord
  has_many :plane_model_family

  def incentive(user_id, cost)
    @tier_1 = 1000000000
    @tier_2 = 5000000000
    @tier_3 = 10000000000
    @tier_4 = 50000000000
    @user_id = user_id
    @cost = cost.to_i
    @total_p = @cost
    Plane.where(user_id: @user_id).each do |p|
      @total_p += p.book_value
    end
    if @total_p >= @tier_4
      @adjusted_cost = 0.5*@cost
      return "Because total #{self.name} assets in your portfolio exceeds the value of #{@tier_4} you're granted %50 discount. Adjusted Price: #{@adjusted_cost}"
    elsif @total_p >= @tier_3
      @adjusted_cost = 0.6*@cost
      return "Because total #{self.name} assets in your portfolio exceeds the value of #{@tier_3} you're granted %40 discount. Adjusted Price: #{@adjusted_cost}"
    elsif @total_p >= @tier_2
      @adjusted_cost = 0.75*@cost
      return "Because total #{self.name} assets in your portfolio exceeds the value of #{@tier_2} you're granted %25 discount. Adjusted Price: #{@adjusted_cost}"
    elsif @total_p >= @tier_1
      @adjusted_cost = 0.9*@cost
      return "Because total #{self.name} assets in your portfolio exceeds the value of #{@tier_1} you're granted %10 discount. Adjusted Price: #{@adjusted_cost}"
    else
      return "Due to small size of your fleet #{self.name} is not able to offer any incentives."
    end
  end

end
