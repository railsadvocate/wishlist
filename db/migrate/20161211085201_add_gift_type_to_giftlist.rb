class AddGiftTypeToGiftlist < ActiveRecord::Migration[5.0]
  def change
    add_column :giftlists, :gift_type, :string
  end
end
