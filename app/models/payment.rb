class Payment < ActiveRecord::Base
	belongs_to :user

  def take_payment credits
    
  end
end