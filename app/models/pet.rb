class Pet < ActiveRecord::Base
  TYPES = ['Dog', 'Cat', 'Rodent', 'Misc. mammal', 'Bird', 'Reptile', 'Amphibian', 'Anthropod']
  

  scope :lost, -> { where(lost: true) }
  scope :found, -> { where(lost: false) }
  scope :type, -> (type) { where(species: type) }
  scope :subtype, -> (subtype) { where(breed: subtype) }


  has_attached_file :avatar,
                    :styles => { :large => "1400x1400>",
                                  :medium => "300x300>",
                                  :thumb => "100x100>" },
                                  :default_url => "/images/:style/No_image_available.png"

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_inclusion_of :lost, :in => [true, false]
  validates :species, :presence => true
  validates :breed, :presence => true
  validates :description, :presence => true
  validates :color, :presence => true
  validates :loc_lost, :presence => true

  belongs_to :user

end

