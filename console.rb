require_relative("models/album.rb")
require_relative("models/artist.rb")
require("pry-byebug")

artist1 = Artist.new(
  {
    "name" => "Queen"
  }
)

artist1.save()

album1 = Album.new(
  {
    "title" => "Happy Birthday",
    "genre" => "Rock",
    "artist_id" => artist1.id()
  }
)

album1.save()


binding.pry

nil
