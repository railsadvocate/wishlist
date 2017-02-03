class AddWishlistIdToGift < ActiveRecord::Migration[5.0]
  def change
    add_column :gifts, :giftlist_id, :integer
  end
end
