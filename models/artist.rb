require("pg")
require_relative("album.rb")
require_relative("../db/sql_runner.rb")

class Artist
attr_reader :id
attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i()
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def list()
    sql = "SELECT * FROM artists;"
    results = SqlRunner.run(sql)
    return results.map{|result| Artist.new(result)}
  end

  def update()
    sql = "UPDATE artists SET (name) = ($1) WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete()
    sql = "DELETE FROM artists WHERE id = $1";
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [@artist_id]
    artists = SqlRunner.run(sql, values)
    artist_hash = artists[0]
    return Artist.new(artist_hash)
  end


end
