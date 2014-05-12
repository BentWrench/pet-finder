class AddLostToPets < ActiveRecord::Migration
  def change
    add_column :pets, :lost, :boolean
  end
end
