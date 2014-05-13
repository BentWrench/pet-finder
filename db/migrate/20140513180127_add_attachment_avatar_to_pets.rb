class AddAttachmentAvatarToPets < ActiveRecord::Migration
  def self.up
    change_table :pets do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :pets, :avatar
  end
end
