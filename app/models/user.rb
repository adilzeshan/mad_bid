class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [ :username ]
	
	has_many :bids
  has_many :payments

  #private
  def makes_bid item
#    if item.expired?
#      item.active = true #false
#    else
      time_now = Time.now
      my_bid = Bid.create(user: self, listing: item)
      my_bid.update_price item.current_price
      item.add_bid(self.username, my_bid.id, time_now)
#    end
  end

  def make_payment credits
    
  end

  def add_credits amount
    self.update(amount_of_credits: self.amount_of_credits + amount * 5)
  end

  def deduct_credits_for_bid 
    
  end
end