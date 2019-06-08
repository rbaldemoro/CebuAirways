class Seat < ApplicationRecord
	validates :flight_id, presence: true, numericality: {only_integer: true, greater_than: 0}
	validates :name, presence: true
	validates :baggage, presence: true, numericality: {greater_than: -1}
	
	validate :check_baggage
	validate :check_capacity

	private

	def check_baggage
		@seats = Seat.where(flight_id: flight_id)
		@total_baggage = 0;
		
		@seats.each do |seat|
			@total_baggage += seat.baggage
		end

		@flight = Flight.find(flight_id)

		if @total_baggage + baggage > @flight.baggage then
			errors.add(:baggage,"Exceeds weight allowance by "+ (-1 * (@flight.baggage - @total_baggage - baggage)).to_s)
		end
	end

	def check_capacity
		@seats = Seat.where(flight_id: flight_id).length
	
		@flight = Flight.find(flight_id).capacity

		if @seats + 1 > @flight then
			errors.add(:flight_id," was full!")
		end
	end

end
