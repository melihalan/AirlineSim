class PlaneManufacturer < ApplicationRecord
  has_many :plane_model_family

  def incentive(user_id, cost, count)
    @tier_1 = 1000000000
    @tier_2 = 5000000000
    @tier_3 = 10000000000
    @tier_4 = 50000000000
    @user_id = user_id
    @cost = cost.to_i
    @count = count.to_i
    @total_p = @cost * @count
    Plane.where(user_id: @user_id).each do |p|
      @total_p += p.book_value
    end
    if @total_p >= @tier_4
      @adjusted_cost = 0.5*@cost*@count
      return "Because total #{self.name} assets in your portfolio exceeds the value of #{@tier_4} you're granted %50 discount. Adjusted Price: #{@adjusted_cost}", @adjusted_cost
    elsif @total_p >= @tier_3
      @adjusted_cost = 0.6*@cost*@count
      return "Because total #{self.name} assets in your portfolio exceeds the value of #{@tier_3} you're granted %40 discount. Adjusted Price: #{@adjusted_cost}", @adjusted_cost
    elsif @total_p >= @tier_2
      @adjusted_cost = 0.75*@cost*@count
      return "Because total #{self.name} assets in your portfolio exceeds the value of #{@tier_2} you're granted %25 discount. Adjusted Price: #{@adjusted_cost}", @adjusted_cost
    elsif @total_p >= @tier_1
      @adjusted_cost = 0.9*@cost*@count
      return "Because total #{self.name} assets in your portfolio exceeds the value of #{@tier_1} you're granted %10 discount. Adjusted Price: #{@adjusted_cost}", @adjusted_cost
    else
      @adjusted_cost = @cost*@count
      return "Due to small size of your fleet #{self.name} is not able to offer any incentives.", @adjusted_cost
    end
  end

end
