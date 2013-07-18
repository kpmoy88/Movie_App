class Movie < ActiveRecord::Base

	validates :title, :description, presence:true
	validates :description, length: { minimum: 11 }
	validates :year_released, numericality: {greater_than_or_equal_to: 1, only_integer: true}
	validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5, only_integer: true}

	def self.search_for(query)
		Movie.where("title LIKE :query OR description LIKE :query OR year_released LIKE :query", {:query => "%#{query}%"})
	end
end
