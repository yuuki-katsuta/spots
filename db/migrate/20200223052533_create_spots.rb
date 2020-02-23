class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :image_name
      t.string :address
      t.text :about

      t.timestamps
    end
  end
end
