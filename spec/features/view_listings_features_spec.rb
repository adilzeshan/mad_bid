# require 'spec_helper'

# feature 'View Listings' do
# 	scenario 'visiting an empty page displays a no-listings message' do
# 		Listing.delete_all
# 		visit '/'
# 		expect(page).to_not have_css '.auctions :first-child .listing'
# 		expect(page).to have_content 'No listings currently present. Come by later ;)'
# 	end
# 	scenario 'adding a listing, displays a listing' do
# 		create_listing('iPhone 5 16GB', 'Brilliant 4-inch Retina display', '12.99', '529.99', '0.01', 5)
# 		visit '/'
# 		expect(page).to have_css '.auctions :first-child .listing', text: 'iPhone 5 16GB'
# 	end
# end

# after(:all) do
# 	Listing.delete_all
# end