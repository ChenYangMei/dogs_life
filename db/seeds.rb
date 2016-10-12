# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Area.destroy_all

a1 = Area.create :name => "Acacia Avenue Reserve", :address => "68 Acacia Ave, North Lambton NSW", :size => "Medium"
a2 = Area.create :name => "Ballast Ground", :address => "LOT 106 Hunter St, Stockton NSW 2295", :size => "Big"
a3 = Area.create :name => "Braye Park", :address => "74 Edith St, Waratah NSW", :size => "Tremendous", :open_at_all_times => false, :open_times => "sunrise to 9am, 5pm to sunset"
a4 = Area.create :name => "Honeysuckle/Carrington Dog Off-Leash Area", :address => "1A Young St, Carrington NSW 2294", :size => "Small"
a5 = Area.create :name => "Dixon Park Reserve", :address => "44 Ocean St, Merewether NSW 2291", :size => "Small", :open_at_all_times => false, :open_times => "sunrise to 9am"
a6 = Area.create :name => "Elermore Vale Park", :address => "13 Cheviot Cl, Elermore Vale NSW 2287", :size => "Small", :open_at_all_times => false, :open_times => "sunrise to 9am, 5pm to sunset"
a7 = Area.create :name => "Horseshoe Beach", :address => "Horseshoe Beach Rd, Newcastle NSW", :size => "Small"
a8 = Area.create :name => "Islington Park", :address => "2 Park Rd, Tighes Hill NSW 2297", :size => "Medium"
a9 = Area.create :name => "King Edward Park", :address => "York Drive, Newcastle NSW", :size => "Medium"
a10 = Area.create :name => "Maryland Dr Reserve", :address => "48 Maryland Drive, Maryland NSW 2287", :size => "Medium"
a11 = Area.create :name => "Michael St Reserve", :address => "56 Michael St, North Lambton NSW 2299", :size => "Small"
a12 = Area.create :name => "Nesca Park", :address => "86 Nesca Parade, The Hill NSW 2300", :size => "Medium"
a13 = Area.create :name => "Pitt St Reserve", :address => "64 Pitt St, Stockton NSW 2295", :size => "Medium"
a14 = Area.create :name => "Purdue Park", :address => "14 Hart St, Mayfield NSW 2304", :size => "Small"
a15 = Area.create :name => "Tarro Recreation Area", :address => "48 Weingartner Ave, Tarro NSW 2322", :size => "Big"
a16 = Area.create :name => "Upper Reserve", :address => "23/53 B53, Wallsend NSW 2287", :size => "Small"
a17 = Area.create :name => "West End Park", :address => "LOT 3152 Dora Rd, Adamstown NSW 2289", :size => "Small", :open_at_all_times => false, :open_times => "sunrise to 9am, 5pm to sunset"




User.destroy_all

u1 = User.create :name => "Yangmei", :email => "yangmei@ga.co", :password => "chicken", :password_confirmation => "chicken", :admin => true

u1.areas << a1 << a2 << a3 << a4 << a5 << a6 << a7 << a8 << a9 << a10 << a11 << a12 << a13 << a14 << a15 << a16 << a17


Facility.destroy_all

f1 = Facility.create :name => "Fenced"
f2 = Facility.create :name => "Fresh Water"
f3 = Facility.create :name => "Seating"
f4 = Facility.create :name => "Waste Bin"
f5 = Facility.create :name => "Waste Bags"
f6 = Facility.create :name => "Shelter"
f7 = Facility.create :name => "BBQ"
f8 = Facility.create :name => "Car Park"
f9 = Facility.create :name => "Off Street Parking"



Terrain.destroy_all

t1 = Terrain.create :name => "Beach"
t2 = Terrain.create :name => "Park"
t3 = Terrain.create :name => "Lawn"
t4 = Terrain.create :name => "Trees"
t5 = Terrain.create :name => "Bush"
t6 = Terrain.create :name => "Lake"
t7 = Terrain.create :name => "Dam"
t8 = Terrain.create :name => "River"
t9 = Terrain.create :name => "Slopy"
t10 = Terrain.create :name => "Flat"
