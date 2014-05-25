class AddColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
    	t.string :name
  	end

    create_table :colors_pets, id: false do |t|
      t.belongs_to :pet
      t.belongs_to :color
    end

    remove_column :pets, :color

  end
end
