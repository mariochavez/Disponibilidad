class Hotel
  include Mongoid::Document
  field :name, :type => String
  field :address, :type => String
  field :description, :type => String

  embeds_many :rooms
end
