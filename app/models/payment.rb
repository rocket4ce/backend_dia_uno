class Payment < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :post

  validates :post_id, presence: true
  validates :usuario_id, presence: true
  before_save :set_defaults
	

	private
	def set_defaults
		self.estado ||= 1
	end
end
