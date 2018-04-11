require_relative("models/album.rb")
require_relative("models/artist.rb")
require("pry-byebug")

artist1 = Artist.new(
  {
    "name" => "Queen"
  }
)

artist1.save()

artist2 = Artist.new(
  {
    "name" => "Bobby"
  }
)

artist2.save()

album1 = Album.new(
  {
    "title" => "Happy Birthday",
    "genre" => "Rock",
    "artist_id" => artist1.id()
  }
)

album1.save()

album2 = Album.new(
  {
    "title" => "Drummer Boy",
    "genre" => "Reggae",
    "artist_id" => artist2.id()
  }
)

album2.save()

album3 = Album.new(
  {
    "title" => "Fast Cars",
    "genre" => "Reggae",
    "artist_id" => artist2.id()
  }
)

album3.save()

binding.pry

nil
