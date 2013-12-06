class WelcomeController < ApplicationController
  def index
  	@news = PublicActivity::Activity.all.order("created_at DESC")
  end
end
