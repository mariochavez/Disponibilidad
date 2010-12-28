class Disponibility
  include Mongoid::Document
  field :start_date, :type => Date
  field :end_date, :type => Date
  field :rooms, :type => Integer
  field :price, :type => Float

  embedded_in :room, :inverse_of => :disponibilities
end
