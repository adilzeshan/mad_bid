Rails.configuration.stripe = {
  :publishable_key => 'pk_test_yenvKU3x9QQS2WcODkHHCEjQ',
  :secret_key      => 'sk_test_xl2Gi2mAhrzixtsgVOzU6CIP'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]