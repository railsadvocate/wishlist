class AddNewGiftlistFieldToWishlists < ActiveRecord::Migration[5.0]
  def change
    add_column :giftlists, :new_giftlist, :boolean, default: true
  end
end
