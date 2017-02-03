class Giftlist < ApplicationRecord
  validates :gift_type, presence: true
  validates :user, presence: true
  belongs_to :user
  has_many :gifts
end
