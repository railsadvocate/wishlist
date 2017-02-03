class RemoveTypeFromGiftlist < ActiveRecord::Migration[5.0]
  def up
    add_column :giftlists, :gift_type, :string
  end
end
