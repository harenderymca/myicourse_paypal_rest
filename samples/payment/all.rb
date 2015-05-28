# #GetPaymentList Sample
# This sample code demonstrate how you can
# retrieve a list of all Payment_Rest resources
# you've created using the Payments API.
# Note various query parameters that you can
# use to filter, and paginate through the
# payments list.
# API used: GET /v1/payments/payments
require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

# ###Retrieve
# Retrieve the PaymentHistory  by calling the
# `all` method
# on the Payment_Rest class
# Refer the API documentation
# for valid values for keys
# Supported paramters are :count, :next_id
@payment_history = Payment_Rest.all( :count => 5 )

# List Payments
logger.info "List Payment_Rest:"
@payment_history.payments.each do |payment|
  logger.info "  -> Payment_Rest[#{payment.id}]"
end
