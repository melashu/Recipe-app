User.create!(name:'Nelashu', email: 'meshu.amare@gmail.com',password: '123456789')
User.create!(name:'Mona', email: 'mona.amare@gmail.com',password: '123456789')

Recipe.create!(name:'cooking', preparation_time: 1, cooking_time: 1,description:'show', user_id: User.first.id, public: true) ;

Food.create!(name:'Apple',measurement_unit:'g',price: 15.5,quantity: 5, user_id: User.first.id)
Food.create!(name:'Manago',measurement_unit:'g',price: 15.5,quantity: 5, user_id: User.first.id)
