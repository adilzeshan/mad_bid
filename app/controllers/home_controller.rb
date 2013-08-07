class HomeController < ApplicationController
  def index
  	if current_admin
  		render 'admins_pannel/index'
  	else
  		render 'listings/index'
  	end
  end
end
