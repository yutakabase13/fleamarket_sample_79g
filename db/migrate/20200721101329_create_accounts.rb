class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :first_name, null: false
      t.string :family_name, null: false
      t.string :hurigana_first, null: false
      t.string :hurigana_family, null: false
      t.date :birthday, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
