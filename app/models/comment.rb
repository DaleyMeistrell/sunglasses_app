class Comment < ActiveRecord::Base
  	belongs_to :product

	 validates :title, presence: true, length: { minimum: 5 }
end
