class Bid < ActiveRecord::Base
	# validates_presence_of :value, numericality: true
	belongs_to :product
	belongs_to :user
end
