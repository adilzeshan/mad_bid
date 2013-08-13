dispatcher = new WebSocketRails('localhost:3000/websocket')

channel = dispatcher.subscribe('bids')
channel.bind 'new', (listing) ->
	# $('.li-' + listing.id + ' .price').text('£' + (listing.current_price/100).toFixed(2));
	# $('.li-' + listing.id + ' .bidder').text(listing.latest_bidder);
	# resetTimer(listing.id);
	fetchAndAnimateBid(listing.id, listing.current_price, listing.latest_bidder)
