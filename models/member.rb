require_relative('../db/sql_runner.rb')

class Member

  attr_accessor :age, :first_name, :last_name, :house_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name,
      house_id,
      age
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @last_name, @house_id, @age]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def house()
    house = House.find(@house_id)
    return house
  end

  def update()
    sql = "UPDATE members
    SET
    (
    first_name,
    last_name,
    house_id,
    age
    ) =
    (
    $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@first_name, @last_name, @house_id, @age, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM members"
    values = []
    member_data = SqlRunner.run(sql, values)
    members = map_items(member_data)
    return members
  end

  def self.map_items(member_data)
    return member_data.map { |member| Member.new(member) }
  end

  def self.find(id)
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    member = Member.new(result)
    return member
  end

  def format_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

end
