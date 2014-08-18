class User < ActiveRecord::Base

  validates :nickname, presence: true
  validates :uid, presence: true, uniqueness: true, length: { is: 17 }
  validates :image, presence: true
end
