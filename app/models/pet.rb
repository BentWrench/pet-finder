class Pet < ActiveRecord::Base
  include Filterable

  TYPES = ['Dog', 'Cat', 'Rodent', 'Misc. mammal', 'Bird', 'Reptile', 'Amphibian', 'Anthropod']
  LOCATIONS = ['Downtown', 'NE Portland', 'NW Portand', 'SE Portland', 'SW Portland', 'N Portland',
               'Beaverton', 'Gresham', 'Clackamas', 'Tigard', 'Tualatin', 'Happy Valley', 'Milwaukie',
               'Lake Oswego', 'Hilsboro', 'Aloha', 'West Linn', 'Oregon City', 'Troutdale', 'Wood Village', 'Fairview']
  COLORS = %w(Brown Black White Gray Yellow Green Red Blue)

  scope :lost, -> (bool=true) { self.where(lost: bool) }
  scope :found, -> { self.where(lost: false) }
  scope :species, -> (type) { self.where(species: type) }
  scope :subtype, -> (subtype) { self.where(breed: subtype) }
  scope :loc_lost, -> (location) { self.where(loc_lost: location) }

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
  validates :loc_lost, :presence => true

  belongs_to :user
  has_and_belongs_to_many :colors


  def color_ids
    self.colors.collect do |color|
      color.id
    end
  end

  def color_ids=(colors)
    self.colors = Color.find(colors)
  end

  def timed_destroy
    @pets = Pet.all
    @pets.each do |pet|
      if Time.now.utc < pet.created_at + 5
        pet.destroy
      end
    end
  end

end

