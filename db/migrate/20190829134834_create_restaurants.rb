class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :county
      t.string :postcode
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
