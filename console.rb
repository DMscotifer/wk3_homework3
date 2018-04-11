require_relative("models/album.rb")
require_relative("models/artist.rb")
require("pry-byebug")

artist1 = Artist.new(
  {
    "name" => "Queen"
  }
)

artist1.save()
