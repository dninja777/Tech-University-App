class Course < ApplicationRecord
	validates :name, presence: true, length: { minimum: 5, maximum: 50 }
	validates :short_name, presence: true, length: {minimum: 1, maximum: 6}
	validates :description, presence: true, length: {minimum: 10, maximum: 250}


end