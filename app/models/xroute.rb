class Xroute < ApplicationRecord

  has_many :city
  has_many :user
  has_many :flight

  after_create :calculate, on: :create

  def origin
    City.find(self.origin)
  end

  def destination
    City.find(self.destination)
  end

  def calculate                                     #Returns distance between 2 cities
    @rad_per_deg = Math::PI/180                     # PI / 180
    @rkm = 6371                                     # Earth radius in kilometers
    @origin = self.origin
    @destination = self.destination
    @lat1_rad = @origin.latitude * @rad_per_deg
    @lon1_rad = @origin.longtitude * @rad_per_deg
    @lat2_rad = @destination.latitude * @rad_per_deg
    @lon2_rad = @destination.longtitude * @rad_per_deg
    @dlat_rad = @lat2_rad - @lat1_rad               # Delta, converted to rad
    @dlon_rad = @lon2_rad - @lon1_rad               # Delta, converted to rad

    a = Math.sin(@dlat_rad/2)**2 + Math.cos(@lat1_rad) * Math.cos(@lat2_rad) * Math.sin(@dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    @distance = @rkm * c                            # Delta in kilometers

    @max_num_pas = (@origin.population + @destination.population) / 240
    @fcd = @max_num_pas / 1000 * 3
    @bcd = @fcd * 10
    @ecd = @max_num_pas - @bdc - @fcd

    self.update(distance: @distance, max_num_pas: @max_num_pas, ecd: @ecd, bcd: @bcd, fcd: @fcd)
    return self.distance, self.max_num_pas
  end

  def name
    @origin = self.origin
    @destination = self.destination
    return "#{@origin.name}-#{@destination.name}"
  end
end
