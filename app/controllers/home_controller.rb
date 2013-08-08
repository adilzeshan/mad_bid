class HomeController < ApplicationController
  def index
  	if current_admin
  		render 'admins_pannel/index'
  	else
  		#render 'listings/index'
  		"Ha"
  	end
  end
end
