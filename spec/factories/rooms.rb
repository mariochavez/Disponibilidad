# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :room do |f|
  f.name { Factory.next(:room_type) }
  f.description "Bonita habitacion"
  f.price 100.00
end

Factory.sequence :room_type do |s|
  "Tipo #{s}"
end
