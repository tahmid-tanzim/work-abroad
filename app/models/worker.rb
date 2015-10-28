class Worker < ActiveRecord::Base
  has_many :work_experiences

  # Named Scopes
  scope :newest_first, lambda {order("workers.created_at DESC")}
  scope :search_by_name, lambda {|query|
    where(["fullname LIKE ?", "%#{query}%"])
  }
end
