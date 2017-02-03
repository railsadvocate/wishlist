class Gift < ApplicationRecord
  belongs_to :giftlist
  validates :name,
            presence: true,
            length: {in: 2..75 }

  validates :estimated_price,
            presence: true,
            numericality: true

  validates :description,
            length: {in: 10..200},
            allow_blank: true

  validates :link,
            presence: true,
            url: true
end
