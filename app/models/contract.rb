class Contract < ApplicationRecord
	belongs_to :client
	belongs_to :Contract
	#has_many :peca
end
