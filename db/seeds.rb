# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# first_admin = Admin.create( username: 'admin', password: ENV['admin_pwd'] )
first_admin = Admin.create(email: 'admin@locobid.co.uk', password: 'Locobid1984')