class Comment < ActiveRecord::Base
  	belongs_to :product

	 validates :body, presence: true, length: { minimum: 5 }
end
