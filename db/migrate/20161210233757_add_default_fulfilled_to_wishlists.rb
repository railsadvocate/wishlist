class AddDefaultFulfilledToWishlists < ActiveRecord::Migration[5.0]
  def change
    add_column :giftlists, :fulfilled, :string, default: false
  end
end
