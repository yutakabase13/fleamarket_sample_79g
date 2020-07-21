class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :first_name, null: false
      t.stging :family_name, null: false
      t.string :zipcode, null: false, index: true
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :others
      t.string :phone_number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
