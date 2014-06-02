class AddAgeToPets < ActiveRecord::Migration
  def change
    add_column :pets, :age, :string
  end
end
