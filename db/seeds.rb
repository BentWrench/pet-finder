
User.create(email: 'admin@test.com', password: '74108520', role: 'admin')
admin1 = User.create(email: 'admin1@test.com', password: 'password', role: 'admin')
User.create(email: 'user@test.com', password: '74108520')
Pet.create(lost: true, user: admin1, species: 'Reptile', breed: 'Iguana', description: 'Lost iguana belonging to admin1@test.com', color: 'green', loc_lost: 'Downtown')
Pet.create(lost: true, user: admin1, species: 'Dog', breed: 'Poodle', description: 'Lost poodle belonging to admin1@test.com', color: 'white', loc_lost: 'Downtown')
Pet.create(lost: false, user: admin1, species: 'Reptile', breed: 'Chameleon', description: 'Found chameleon belonging to admin1@test.com', color: '???', loc_lost: 'Downtown')
