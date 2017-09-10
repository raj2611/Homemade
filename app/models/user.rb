class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :contents
	has_many :likes
	before_save { self.email = email.downcase }
	mount_uploader :profilepic, ProfilepicUploader
	validates :username, presence: true,
					 length: {minimum: 5,maximum: 100}
	VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true,
					 length: {maximum: 105},
					 uniqueness: { case_sensitive: false},
					 format: { with: VALID_EMAIL_REGEX }
	
end