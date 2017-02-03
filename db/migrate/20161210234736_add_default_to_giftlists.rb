class AddDefaultToGiftlists < ActiveRecord::Migration[5.0]
  def up
    add_column :giftlists, :fulfilled, :boolean, default: false
  end
end
