class Product < ActiveRecord::Base
	 has_attached_file :image, styles: { small: "300x200", med: "600x400", large: "1200x800" }
	 validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	 has_many :comments
	 validates :title, presence: true, length: { minimum: 5 }
end
