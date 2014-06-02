class UpdatePetAges < ActiveRecord::Migration
  def change
    change_column :pets, :age, :string, default: 'Unknown'
  end
end
