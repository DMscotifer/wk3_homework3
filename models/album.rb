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


  def self.show_all()
    sql = "SELECT * FROM albums;"
    results = SqlRunner.run(sql)
    return results.map{|result| self.new(result)}
  end

  def update()
    sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4;"
    values = [@title, @genre, @artist, @artist_id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def album()
    sql = "SELECT * FROM albums WHERE id = $1;"
    values = [@id]
    album = SqlRunner.run(sql, values)
    album_hash = album[0]
    return Album.new(album_hash)
  end

end
