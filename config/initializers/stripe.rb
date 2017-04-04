if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_UUHNsh2x4UtJFSIzEfETbk1R',
    :secret_key => 'sk_test_0eOBWCVIWtAqlQM56b1zPvmH'
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_UUHNsh2x4UtJFSIzEfETbk1R',
    :secret_key => 'sk_test_0eOBWCVIWtAqlQM56b1zPvmH'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
