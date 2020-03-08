class RemoveSexFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :sex, :string
  end
end
