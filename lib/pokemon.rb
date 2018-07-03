class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(info = {})
    @name = info[:name]
    @type = info[:type]
    @id = info[:id]
    @db = info[:db]
    @hp = info[:hp]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    pokemon = Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
    # binding.pry
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
