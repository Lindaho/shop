class AddAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country, :string
    add_column :users, :address_1, :text
    add_column :users, :address_2, :text
  end
end
