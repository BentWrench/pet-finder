class Pet < ActiveRecord::Base

  validates :species, :presence => true
  validates :breed, :presence => true
  validates :description, :presence => true
  validates :color, :presence => true
  validates :loc_lost, :presence => true

  belongs_to :user

end

