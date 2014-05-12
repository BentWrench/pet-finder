class AddPets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :species
      t.string :breed
      t.string :description
      t.string :color
      t.string :loc_lost

      t.timestamps
    end
  end
end
