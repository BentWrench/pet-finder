class AddDeletionsToPets < ActiveRecord::Migration
  def change
    add_column :pets, :delete_time, :boolean
  end
end
