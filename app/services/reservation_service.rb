class ReservationService
  def find_room hotel_id, room_id, start_date, end_date
    disponibility = look_for_disponibility hotel_id, room_id, start_date, end_date

    logger = Rails.logger

    result = []
    disponibility.each do |ds|
      logger.debug "#{self.class} start_date: #{ds.start_date} end_date: #{ds.end_date} rooms: #{ds.rooms}"

      dates = calculate_range_dates(ds, start_date, end_date)
      (dates[0]..dates[1]).each do |d|
        available =  { :date => d, :rooms => ds.rooms, :price => ds.price }
        index = index_of_entry result, d
        if index > -1
         result[index] = available
        else
          result << available
        end
      end
    end
    result
  end

  private
  def calculate_range_dates disponibility, start_date, end_date
    [disponibility.start_date >= start_date ? disponibility.start_date : start_date, disponibility.end_date <= end_date ? disponibility.end_date : end_date]
  end

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
    disponibility.concat(room.disponibilities.where(:start_date.gte  => start_date).documents)
    disponibility.concat(room.disponibilities.where(:end_date.lte => end_date).documents)

    disponibility
  end
end
