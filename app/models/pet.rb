class Pet < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/No_image_available.png"

validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates_inclusion_of :lost, :in => [true, false]
  validates :species, :presence => true
  validates :breed, :presence => true
  validates :description, :presence => true
  validates :color, :presence => true
  validates :loc_lost, :presence => true

  belongs_to :user

end

