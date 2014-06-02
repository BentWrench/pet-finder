class AddGenderToPets < ActiveRecord::Migration
  def change
    add_column :pets, :gender, :string

  end
end
