class Post < ActiveRecord::Base
	validates :titulo, presence: true, uniqueness: true
	has_many :attachments
	belongs_to :usuario
end
