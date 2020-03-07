class AddAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :live, :string
  end
end
