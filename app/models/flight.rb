class Flight < ApplicationRecord
	has_many :seats
	
	validates :departure, presence: true
	validates :arrival, presence: true
	validates :destination, presence: true
	validates :baggage, presence: true, numericality: {greater_than: -1}
	validates :capacity, presence: true, numericality: {only_integer: true, greater_than: 0}



end
