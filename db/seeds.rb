# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Author.create([ {:name => 'Logan Leger', :email => 'logan@newaperio.com', :password => "iamawesome"},
                {:name => 'Jonathan Hooper', :email => 'jonathan@newaperio.com', :password => "drivesajeep"},
                {:name => "NewAperio", :email => "hello@newaperio.com", :password => "YGBFKM1337"}])
                
Category.create([{:name => "Rails"}, {:name => "iPhone"}, {:name => "iPad"}, {:name => "Android"}, {:name => "Entrepreneurship"}, {:name => "Design"}])