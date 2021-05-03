class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.decimal :rating
      t.string :car
      t.string :car_color
      t.string :license_plate
      t.string :car_year
      t.string :bio
    end
  end
end
