module GearRatio
  def possible_ratio
    chainring.sprocket_count * cog.sprocket_count
  end
end
