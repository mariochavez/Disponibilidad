class Room
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  field :price, :type => Float

  embedded_in :hotel, :inverse_of => :rooms
  embeds_many :disponibilities
end
