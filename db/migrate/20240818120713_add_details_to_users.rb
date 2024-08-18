class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :integer, default: 0, null: false
    add_column :users, :preferred_hand, :integer, default: 0, null: false
    add_column :users, :gender, :integer, default: 0, null: false
    add_column :users, :birthdate, :date
  end
end
