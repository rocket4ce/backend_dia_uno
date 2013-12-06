class Transaction < ActiveRecord::Base
	validates :token, presence: true
	validates :payerid, presence: true
	validates :ip_address, presence: true
	belongs_to :usuario
	
	def pagar?
		response = procesar_compra
		self.response = response.message		
		if response.success?
			self.save
			self.usuario.payments.each do |payment|
				payment.update(estado: 2)
			end
			true
		else
			false
		end
	end
	private


	def procesar_compra
		EXPRESS_GATEWAY.purchase(self.usuario.costo_compra_pendiente*100, opciones_compra)
	end
	def opciones_compra
		{
			ip: self.ip_address,
			token: self.token,
			payer_id: self.payerid
		}
	end
end
