class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, email: true

  has_many :feeds
end
