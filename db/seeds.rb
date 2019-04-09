# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
movie_id = 1

serie_id = 1

100.times do

  Movie.create(

    title: "Movie #{movie_id} title",

    description: "Description of Movie #{movie_id}",

    rating: 0,

    duration: rand(90..180),

    price: rand(5..25),

    status: ["coming_soon", "preorder", "billboard"].sample,

    progress: 0

  )

  movie_id += 1

end

100.times do

  Serie.create(

    title: "Serie #{serie_id} title",

    description: "Description of Serie #{serie_id}",

    rating: 0,

    price: rand(5..25),

    status: ["coming_soon", "preorder", "billboard"].sample

  )

  number_episodes = rand(10..30)

  episode_id = 1

  number_episodes.times do

    Episode.create(

      title: "Episode #{episode_id} of Serie #{serie_id} title",

      description: "Description of Episode #{episode_id} of Serie #{serie_id}",

      duration: rand(45..120),

      progress: 0,

      serie_id: serie_id

    )

    episode_id += 1

  end

  serie_id += 1

end

rentals_id = 1

200.times do

  Rental.create(

    paid_price: rand(5..50),

    rentable_type: ["Movie", "Serie"].sample,

    rentable_id: [rand(1..(movie_id-1)), rand(1..(serie_id-1))].sample

  )

  rentals_id += 1

end