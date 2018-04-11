require("pg")
require_relative("artist.rb")
require_relative("../db/sql_runner.rb")

class Album
attr_reader :id, :artist_id
attr_writer :title, :genre
  def initialize(options)
    @id = options["id"].to_i()
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end
  # 
  # def show_all()
  #   sql = "SELECT * FROM albums;"
  #   SqlRunner.run(sql)
  # end

  def show_all()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|result| Album.new(result)}
  end

end
