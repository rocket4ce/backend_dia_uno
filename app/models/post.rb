class Post < ActiveRecord::Base
	include Picturable
	include PublicActivity::Model
	validates :titulo, presence: true, uniqueness: true
	has_many :attachments
	belongs_to :usuario
	tracked owner: Proc.new { |controller,model| controller.current_usuario }
end
