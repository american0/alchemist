class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.string :city
      t.text :description
      t.integer :base_price
      t.integer :price_20
      t.integer :price_50
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
