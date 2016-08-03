class Product < ActiveRecord::Base
	validates_presence_of :title, :bidding
	belongs_to :user
	has_many :bids
end
