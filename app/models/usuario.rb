class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook,:twitter]

  validates :username, presence: true, uniqueness: true, 
            length: {in: 5..10, too_short: "Tiene que tener al menos 5 caracteres", too_long: "Puede tener máximo 10 caracteres"},
            format: {with: /([A-Za-z0-9\-\_]+)/, message: "Tu username puede sólo contenter letras, números y guiones"}

  has_many :posts
  has_many :payments  
  has_many :friendships, foreign_key: "usuario_id", dependent: :destroy

  has_many :follows, through: :friendships, source: :friend

  has_many :followers_friendships, class_name: "Friendship", foreign_key: "friend_id"

  has_many :followers, through: :followers_friendships, source: :usuario
  has_many :transactions
  def follow!(amigo_id)
    friendships.create!(friend_id: amigo_id)
  end
  def costo_compra_pendiente
    payments.where(estado: 1).joins("INNER JOIN posts on posts.id == payments.post_id").sum("costo")
  end
  
  def can_follow?(amigo_id)
    not amigo_id == self.id or friendships.where(friend_id: amigo_id).size > 0
  end
  def email_required?
    false
  end
  def self.find_by_facebook_oauth(auth,usuario=nil)
  	usuario = Usuario.where(provider: auth[:provider], uid: auth[:uid]).first

  	unless usuario
  		usuario = Usuario.create(
  			nombre: auth[:nombre],
  			apellido: auth[:apellido],
  			username: auth[:username],
  			email: auth[:email],
  			uid: auth[:uid],
  			provider: auth[:provider],
        password: Devise.friendly_token[0,20]
  		)
  	end

  	usuario

  end
end
