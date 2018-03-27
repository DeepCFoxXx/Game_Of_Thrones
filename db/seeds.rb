require_relative('../models/house')

house1 = House.new({'name' => 'Targaryen'})
house2 = House.new({'name' => 'Stark'})
house3 = House.new({'name' => 'Greyjoy'})
house4 = House.new({'name' => 'Martell'})

house1.save
house2.save
house3.save
house4.save
