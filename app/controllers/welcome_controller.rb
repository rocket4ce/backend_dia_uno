class WelcomeController < ApplicationController
  def index
  	@news = PublicActivity::Activity.all
  end
end
