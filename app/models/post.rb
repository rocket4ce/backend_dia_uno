class Post < ActiveRecord::Base
	include Picturable
	validates :titulo, presence: true, uniqueness: true
	has_many :attachments
	belongs_to :usuario
	include PublicActivity::Model
	tracked owner: Proc.new { |controller,model| controller.current_usuario }
	after_create {|post| post.message 'create'}

	def message action
		msg = {
			resource: 'posts',
			action: action,
			id: self.id,
			obj: self,
			username: self.usuario.username.capitalize,
			user_id: self.usuario.id

		}
		$redis.publish 'rt-change', msg.to_json
	end

end
