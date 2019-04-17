class Bicycle < ActiveRecord::Base
  has_many :gears

  def chainring
    gears.find(chainring: true)
  end

  def cog
    gears.find(cog: true)
  end
end
