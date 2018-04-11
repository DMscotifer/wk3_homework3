require("pg")
require_relative("album.rb")
require_relative("../db/sql_runner.rb")

class Artist
attr_reader :id
attr_writer :name
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




end
