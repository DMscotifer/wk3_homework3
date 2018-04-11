require("pg")
require_relative("album.rb")
require_relative("../db/sql_runner.rb")

class Artists

  def initialize(options)
    @id = options["id"].to_i()
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO artist (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = Sql_runner.run(sql, values)
    @id = result[0]["id"].to_i
  end


end
