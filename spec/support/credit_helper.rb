module CreditHelper

	def select_top_up(credits)
		visit '/'
		click_link 'Top up'
		click_link credits.to_s
		visit '/payment'
	end
end