require 'spec_helper'

describe ReservationService do
  context "Buscar disponibilidad de habitacion" do
  
    describe "por rango de fechas validas" do
      before do
        hotel = Factory.build :hotel
        hotel.rooms << Factory.build(:room)
        hotel.rooms[0].disponibilities << Factory.build(:disponibility)
        hotel.save
      end

      let(:hotel_id) { Hotel.first.id.to_s }
      let(:room_id) { Hotel.first.rooms.first.id.to_s }
      let(:service) { ReservationService.new }
      let(:start_date) { Date.parse("2011-01-06") }
      let(:end_date) { Date.parse("2011-01-09") }
      let(:result) {
        [ { :date => Date.parse("2011-01-06"), :rooms => 2, :price => 110.0 }, 
          { :date => Date.parse("2011-01-07"), :rooms => 2, :price => 110.0 }, 
          { :date => Date.parse("2011-01-08"), :rooms => 2, :price => 110.0 }, 
          { :date => Date.parse("2011-01-09"), :rooms => 2, :price => 110.0 } ]
      }

      it "debe de encontrar habitacion disponible" do
        disponibilities = service.find_room hotel_id, room_id, start_date, end_date
        disponibilities.should =~ result
      end
    end

  end
end
