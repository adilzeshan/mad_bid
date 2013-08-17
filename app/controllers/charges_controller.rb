class ChargesController < ApplicationController
  def new
  end

  def create
  	@amount = params[:amount].to_i
		raise "Unexpected price" unless [200, 300, 400, 500, 600, 1000, 1500, 3750, 2000].include? @amount
		# delete 2000
	  customer = Stripe::Customer.create(
	    :email => current_user.email,
	    :card  => params[:stripeToken]
	  )
	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'gbp'
	  )

	  payment = Payment.create(no_of_credits: @amount*5, payment_amount: @amount, user_id: current_user.id)
	  current_user.add_credits(@amount)

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to charges_path
	  end
end