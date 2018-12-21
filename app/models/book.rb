class Book < ApplicationRecord
	validates :title, presence: true
	validates :page, presence: true, numericality: true
	validates :description, presence: true
end
