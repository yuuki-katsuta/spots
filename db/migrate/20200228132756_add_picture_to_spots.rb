class AddPictureToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :picture, :string
  end
end
