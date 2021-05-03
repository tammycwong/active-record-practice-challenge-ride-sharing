class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :first_name
      t.string :last_name
      t.decimal :rating
      t.string :email
      t.string :cell_number
    end
  end
end
