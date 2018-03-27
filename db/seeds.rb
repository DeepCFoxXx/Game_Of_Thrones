require_relative('../models/member')
require_relative('../models/house')

house1 = House.new({'name' => 'Targaryen'})
house2 = House.new({'name' => 'Stark'})
house3 = House.new({'name' => 'Greyjoy'})
house4 = House.new({'name' => 'Martell'})

house1.save
house2.save
house3.save
house4.save


member1 = Member.new({
  'first_name' => 'Daenerys',
  'last_name' => 'Targaryen',
  'house_id' => house1.id,
  'age' => 30 })
member2 = Member.new({
  'first_name' => 'Arya',
  'last_name' => 'Stark',
  'house_id' => house2.id,
  'age' => 18 })
member3 = Member.new({
  'first_name' => 'Theon',
  'last_name' => 'Greyjoy',
  'house_id' => house3.id,
  'age' => 28 })
member4 = Member.new({
  'first_name' => 'Oberyn',
  'last_name' => 'Martell',
  'house_id' => house4.id,
  'age' => 42 })

member1.save
member2.save
member3.save
member4.save  
