class Worker < ActiveRecord::Base
  has_many :work_experiences

  before_save { email.downcase! }

  validates :national_id,
            presence: true,
            numericality: {
                greater_than_or_equal_to: 0,
                less_than_or_equal_to: 50
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
end
