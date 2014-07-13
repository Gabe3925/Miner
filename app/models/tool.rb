class Tool < ActiveRecord::Base
  belongs_to :user

# Validate name -- Tools each have a name:
  validates :name,
    presence: true,
    length: { maximum: 50 }

# Validate speed -- Tools each have a mining speed:
  validates :speed,
    presence: true,
    numericality: { less_than_or_equal_to: 1000 }

# Validate price -- Tools each have a price, in dollars:
  validates :price,
    presence: true,
    numericality: { more_than_or_equal_to: 0 }

end


