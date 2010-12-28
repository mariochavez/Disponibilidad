# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :disponibility do |f|
  f.start_date Date.parse("2011-01-01")
  f.end_date Date.parse("2011-04-01")
  f.rooms 2
  f.price 110.0
end
