class ReservationService
  def find_room hotel_id, room_id, start_date, end_date
    disponibility = look_for_disponibility hotel_id, room_id, start_date, end_date

    result = []
    (start_date..end_date).each do |d|
      disponibility.each do |ds|
        if d >= ds.start_date || d <= ds.end_date
          available = { :date => d, :rooms => ds.rooms, :price => ds.price }
          index = index_of_entry result, d
          if index > -1
            result[index] = available
          else
            result << available
          end
        end
      end
    end
    result
  end

  private
  def index_of_entry data, date
    index = -1
    data.each_with_index do |r, i|
      if r[:date] == date
        index = i
      end
    end
    index
  end

  def look_for_disponibility hotel_id, room_id, start_date, end_date
    hotel = Hotel.criteria.id(hotel_id).first
    room = hotel.rooms.criteria.id(room_id).first

    disponibility = []
    disponibility.concat(room.disponibilities.where(:start_date.gt  => start_date).documents)
    disponibility.concat(room.disponibilities.where(:end_date.lt => end_date).documents)

    disponibility
  end
end
