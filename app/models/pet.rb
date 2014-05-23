class Pet < ActiveRecord::Base
  scope :lost, -> { where(lost: true) }
  scope :found, -> { where(lost: false) }


  has_attached_file :avatar,
                    :styles => { :large => "600x600>",
                                  :medium => "300x300>",
                                  :thumb => "100x100>" },
                                  :default_url => "/images/:style/No_image_available.png"

  validates_attachment_content_type :avatar,
                                    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates_attachment_size :avatar, :less_than => 5.megabytes,
                                     :message => "Smaller please"

  validates_inclusion_of :lost, :in => [true, false]
  validates :species, :presence => true
  validates :breed, :presence => true
  validates :description, :presence => true
  validates :color, :presence => true
  validates :loc_lost, :presence => true

  belongs_to :user


  def self.timed_destroy
    Pet.all.each do |pet|
      if Time.now > pet.updated_at + 60*60*24*180
        pet.destroy
      end
    end
  end
end

