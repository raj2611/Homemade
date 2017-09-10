class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :content

	validates_uniqueness_of :user,scope: :content

end