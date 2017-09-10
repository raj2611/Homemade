class Content < ActiveRecord::Base
	belongs_to :user
	has_many :likes
	validates :user_id, presence: true
	validates :name, presence: true,
					 length: {minimum: 5,maximum: 100}
	validates :summary, presence: true,
					 length: {minimum: 10,maximum: 500}
	validates :description, presence: true,
					 length: {minimum: 50,maximum: 10000}
	mount_uploader :picture, PictureUploader 
	validate :picture_size
    def totallike
    	self.likes.where(like: true).size
    end

	private
		def picture_size
		if picture.size > 5.megabytes
		errors.add(:picture, "should be less than 5MB" )
		end
	    end	
end