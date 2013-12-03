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
  
end
