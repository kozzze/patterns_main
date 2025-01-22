require 'pg'

class Connection
  private_class_method :new
  @@instance = nil

  def self.instance
    @@instance ||= new
  end

  def initialize()
    @connection = PG.connect(dbname: 'students',
                             user: 'kozzze',
                             password: '123',
                             host: 'localhost',
                             port: 5434,
                             )
  end

  def execute(query, params=[])
    @connection.exec_params(query, params)
  end
  def close
    @connection.close
  end
end




# connection = Connection.instance
# puts connection.execute("SELECT * FROM students", []).to_a
# connection.close
db = Connection.instance
db2 = Connection.instance
puts db == db2
