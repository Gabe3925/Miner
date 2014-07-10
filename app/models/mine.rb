class Mine < ActiveRecord::Base
  belongs_to :user

# Validate name -- mines each have a name:
  validates :name,
    presence: true,
    length: { maximum: 50 }

  # Validate depth:
  validates :depth,
    presence: true,
    numericality: { greater_than_or_equal_to: 0 }

# Validate Richness:
  validates :description,
    presence: true,
    numericality: { greater_than_or_equal_to: -1000 },
    numericality: { less_than_or_equal_to: 1000 }

    # Validate mine image:
  validates :image_data,
    presence: true

  # Validates belongs to User,--must belong to user
  validates :user_id,
    presence: true

end


