class CreateGifts < ActiveRecord::Migration[5.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :description
      t.float :estimated_price
      t.string :link

      t.timestamps
    end
  end
end
