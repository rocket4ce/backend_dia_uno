class RegistrationsController < Devise::RegistrationsController
  
  def new
  	super  	
  	flash[:notice] = session[:omniauth_errors] 
  	@fb_data = session[:facebook_data]
  	
  	session.delete(:omniauth_errors)
  end
  def create  	
  	super
  	session.delete(:facebook_data)
  end
  def update
  	super
  end
  private
	def sign_up_params
		allow = [:email, :username, :password, :password_confirmation]
		params.require(resource_name).permit(allow)
	end
end
