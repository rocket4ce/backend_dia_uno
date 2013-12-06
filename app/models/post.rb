class Post < ActiveRecord::Base
	include Picturable
	validates :titulo, presence: true, uniqueness: true
	has_many :attachments
	belongs_to :usuario
	include PublicActivity::Model
	tracked owner: Proc.new { |controller,model| controller.current_usuario }
end
