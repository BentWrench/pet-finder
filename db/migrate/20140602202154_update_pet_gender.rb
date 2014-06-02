class UpdatePetGender < ActiveRecord::Migration
  def change
    change_column :pets, :gender, :string, default: 'Unknown'
  end
end
