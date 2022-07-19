class AddUsersAndSpendings < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :name
      t.string :password_digest

      t.timestamps
    end

    create_table :spendings do |t|
      t.integer :category, null: false
      t.text :description
      t.decimal :amount, precision: 10, scale: 2
      t.references :user, index: true
    end
  end
end
