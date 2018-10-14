class Deployment < ApplicationRecord
  def description
    "#{cause} - #{city}, #{country}"
  end
end
