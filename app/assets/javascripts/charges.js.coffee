# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#buy-credits').on 'click', ->
    token = (res) ->
      $input = $('<input type=hidden name=stripeToken />').val(res.id)
      $('form').append($input).submit()

    StripeCheckout.open {
      key:         'pk_test_yenvKU3x9QQS2WcODkHHCEjQ',
      address:     false,
      amount:      $('#amount').val(),
      currency:    'gbp',
      name:        $('#amount option:selected').text(),
      description: 'For bidding on auctions',
      panelLabel:  'Checkout',
      token:       token
    }

    return false