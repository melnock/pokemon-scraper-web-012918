class Pokemon

  attr_accessor :name, :type, :id, :db

  def initialize(args)
    args.each {|key, value| self.send("#{key}=", value)}


  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    finder = db.execute("SELECT * FROM pokemon WHERE id= ?;", id)[0]
    Pokemon.new(id: finder[0], name: finder[1], type:finder[2])
  end
end
