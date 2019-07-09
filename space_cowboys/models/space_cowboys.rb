require("pg")


class SpaceCowboy
attr_reader

attr_accessor :id, :name, :species, :bounty_value, :danger_level, :last_known_location, :homewworld, :favourite_weapon, :cashed_in, :collected_by

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value']
    @danger_level = options['danger_level']
    @last_known_location = options['last_known_location']
    @homewworld = options['homewworld']
    @favourite_weapon = options['favourite_weapon']
    @cashed_in = options['cashed_in']
    @collected_by = ['collected_by']
  end

  def save
    db = PG.connect({ dbname: 'space_cowboy', host: 'localhost'})
    sql = "INSERT INTO space_cowboy (name, species, bounty_value, danger_level, last_known_location, homewworld, favourite_weapon, cashed_in, collected_by)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
    RETURNING id;"
    db.prepare('save', sql)
    values = [@name, @species, @bounty_value, @danger_level, @last_known_location, @homewworld, @favourite_weapon, @cashed_in, @collected_by]
    cowboy = db.exec_prepared('save', values)
    @id = cowboy.first['id']
    db.close
  end

  def update
      db = PG.connect({ dbname: 'space_cowboy', host: 'localhost'})
      sql = "UPDATE space_cowboy
      SET (name, species, bounty_value, danger_level, last_known_location, homewworld, favourite_weapon, cashed_in, collected_by)
      = ($1, $2, $3, $4, $5, $6, $7, $8, $9)
      WHERE id = $10"
      values = [@name, @species, @bounty_value, @danger_level, @last_known_location, @homewworld, @favourite_weapon, @cashed_in, @collected_by, @id]
      db.prepare('update', sql)
      db.exec_prepared('update', values)
      db.close

  end


  def self.delete(id)
    db = PG.connect({dbname: 'space_cowboy', host: 'localhost'})
    sql = "DELETE FROM space_cowboy
    WHERE id = $1"
    values = [id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close()

  end

#

end
