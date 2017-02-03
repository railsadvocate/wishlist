class CreateGiftlists < ActiveRecord::Migration[5.0]
  def change
    create_table :giftlists do |t|
      t.string :type
      t.string :fulfilled

      t.timestamps
    end
  end
end
