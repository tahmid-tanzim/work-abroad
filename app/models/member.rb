class Member < ActiveRecord::Base
  attr_accessor :remember_token
  has_many :work_experiences

  before_save { email.downcase! }

  attr_accessor :remember_token, :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest
  validates :name,  presence: true, length: { maximum: 50 }

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
            },
            allow_nil: true

  # Named Scopes
  scope :newest_first, lambda {
                       order("members.created_at DESC")
                     }
  scope :search_by_name, lambda { |query|
                         where(["name LIKE ?", "%#{query}%"])
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

  # Remembers a member in the database for use in persistent sessions.
  def remember
    self.remember_token = Member.new_token
    update_attribute(:remember_digest, Member.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    # return false if remember_digest.nil?
    # BCrypt::Password.new(remember_digest).is_password?(remember_token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a member.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    MemberMailer.account_activation(self).deliver_now
  end

  private

  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token  = Member.new_token
    self.activation_digest = Member.digest(activation_token)
  end
end
