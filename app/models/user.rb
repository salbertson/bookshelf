class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, email: true

  <<<<<<< HEAD
  has_many :subscriptions
  =======
  has_many :subscriptions
  >>>>>>> My commit
  has_many :feeds, through: :subscriptions
  has_many :entries, through: :feeds
end
