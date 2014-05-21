class User < ActiveRecord::Base
  # after_create :send_welcome_email

  ROLES = %w(admin user)
  has_many :pets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :role, presence: true, inclusion: { in: ROLES, message: "%{value} is not a valid role"}

  def lost_pets
    self.pets.select { |pet| pet.lost }
  end

  def found_pets
    self.pets.select { |pet| !pet.lost }
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
