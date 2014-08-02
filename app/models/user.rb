require 'bcrypt'

class User < ActiveRecord::Base
  has_many :mines
  has_many :tools

  include BCrypt

  # Add handlers to run when creating and saving
  before_create :create_remember_token
  before_save :normalize_fields

  # Validate name:
  validates :name,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 50 }

  # Validate positive dollars -- dollars must be more or equal to $0
  validates :dollars,
    numericality: { more_than_or_equal_to: 0 }

  # Secure password features:
  has_secure_password

  # Create a new remember token for a user:
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # Hash a token:
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  # Creates a new session token for the user:
  def create_remember_token
    self.remember_token = User.hash(User.new_remember_token)
  end

  # Normalize fields for consistency:
  def normalize_fields
    self.name.downcase!
  end


end
