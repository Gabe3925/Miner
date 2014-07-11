class Mine < ActiveRecord::Base
  belongs_to :user

# Validate name -- mines each have a name:
  validates :name,
    presence: true,
    length: { maximum: 50 }


  # Validates belongs to User,--must belong to user
  validates :user_id,
    presence: true

end


