if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_1qx0oGjWURvwmaf3DRtyLieP',
    :secret_key => 'sk_test_CBh7jJTwZiA4HasQxZFucgYr'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]