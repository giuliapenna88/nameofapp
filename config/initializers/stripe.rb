if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_UUHNsh2x4UtJFSIzEfETbk1R',
    :secret_key => 'sk_test_0eOBWCVIWtAqlQM56b1zPvmH'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
