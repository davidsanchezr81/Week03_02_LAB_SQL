require('pg')


class Bounties
attr_accessor :name, :bounty_value, :homeworld, :collected_by
attr_reader :id

  def initialize(options)
    @name = options['name']
    @bounty_value = options['bounty_value']
    @homeworld = options['homeworld']
    @collected_by = options['collected_by']
    @id = options['id'].to_i if options['id']

  end

  def save()
    db = PG.connect( {dbname: 'bounties', host: 'localhost'})
    sql = "INSERT INTO Bounties
    (
      name,
      bounty_value,
      homeworld,
      collected_by
      )
      VALUES
      ($1, $2, $3, $4)
      RETURNING id
      "
      values = [@name, @bounty_value, @homeworld, @collected_by]
      db.prepare("save", sql)
      @id = db.exec_prepared("save", values)[0]["id"].to_i
      db.close
  end

  def update()
    db = PG.connect( {dbname: 'bounties', host: 'localhost'})
    sql = "UPDATE bounties
    SET  ( name,
        bounty_value,
        homeworld,
        collected_by
        )
        =
        ($1, $2, $3, $4)
        WHERE id = $5"
        values = [@name, @bounty_value, @homeworld, @collected_by, @id]
        db.prepare("update", sql)
        db.exec_prepared("update", values)
        db.close
  end

  def find()
    db = PG.connect( {dbname: 'bounties', host: 'localhost'})
    sql = "SELECT name FROM bounties WHERE "




  end

  def Bounties.all()
    db = PG.connect( {dbname: 'bounties', host: 'localhost'})
    sql = "SELECT * FROM bounties"
    values = []
    db.prepare("all", sql)
    bounties = db.exec_prepared("all", values)
    db.close
    return bounties.map { |bounties_hash| Bounties.new(bounties_hash)}

  end

  def Bounties.delete_all()
    db = PG.connect({dbname: 'bounties', host: 'localhost'})
    sql = "DELETE FROM bounties"
    values = []
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all", values)
    db.close
  end
end
