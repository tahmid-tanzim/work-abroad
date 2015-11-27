class Worker < ActiveRecord::Base
  attr_accessor :remember_token
  has_many :work_experiences

  before_save { email.downcase! }

  validates :national_id,
            presence: true,
            uniqueness: true,
            length: {
                minimum: 1,
                maximum: 17
            },
            numericality: {
                greater_than_or_equal_to: 1
            }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: {
                maximum: 255
            },
            uniqueness: {
                case_sensitive: false
            },
            format: {
                with: VALID_EMAIL_REGEX
            }

  has_secure_password
  validates :password,
            presence: true,
            length: {
                minimum: 6
            }

  # Named Scopes
  scope :newest_first, lambda {
                       order("workers.created_at DESC")
                     }
  scope :search_by_name, lambda { |query|
                         where(["fullname LIKE ?", "%#{query}%"])
                       }

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a worker in the database for use in persistent sessions.
  def remember
    self.remember_token = Worker.new_token
    update_attribute(:remember_digest, Worker.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a worker.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
