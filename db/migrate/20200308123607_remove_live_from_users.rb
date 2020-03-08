class RemoveLiveFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :live, :string
  end
end
