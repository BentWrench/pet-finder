Pet::COLORS.each do |color|
  Color.create(name: color)
end

ADMIN = User.create(email: 'admin@test.com', password: 'password', role: 'admin')
USER = User.create(email: 'user@test.com', password: 'password')

Pet.create(lost: true, user: ADMIN, species: 'Reptile', breed: 'Iguana',
  description: 'Lost iguana listing', colors: Color.where(name: ['Green', 'Black']), loc_lost: 'Downtown')
Pet.create(lost: true, user: ADMIN, species: 'Dog', breed: 'Poodle',
  description: 'Lost poodle listing', colors: Color.where(name: 'Black'), loc_lost: 'Downtown')
Pet.create(lost: false, user: ADMIN, species: 'Reptile', breed: 'Chameleon',
  description: 'Found chameleon listing', loc_lost: 'Downtown')
Pet.create(lost: false, user: ADMIN, species: 'Cat', breed: 'Taudy',
  description: 'Found cat listing', loc_lost: 'SE Portland')
