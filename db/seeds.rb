require_relative('../models/member')
require_relative('../models/house')

house1 = House.new({'name' => 'targaryen'})
house2 = House.new({'name' => 'stark'})
house3 = House.new({'name' => 'greyjoy'})
house4 = House.new({'name' => 'martell'})

house1.save
house2.save
house3.save
house4.save


member1 = Member.new({
  'first_name' => 'daenerys',
  'last_name' => 'targaryen',
  'house_id' => house1.id,
  'age' => 30 })
member2 = Member.new({
  'first_name' => 'arya',
  'last_name' => 'stark',
  'house_id' => house2.id,
  'age' => 18 })
member3 = Member.new({
  'first_name' => 'theon',
  'last_name' => 'greyjoy',
  'house_id' => house3.id,
  'age' => 28 })
member4 = Member.new({
  'first_name' => 'oberyn',
  'last_name' => 'martell',
  'house_id' => house4.id,
  'age' => 42 })

member1.save
member2.save
member3.save
member4.save
