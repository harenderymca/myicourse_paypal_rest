# #GetPayment Sample
# This sample code demonstrates how you can retrieve
# the details of a payment resource.
# API used: /v1/payments/payment/{payment-id}
require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

begin
  # Retrieve the payment object by calling the
  # `find` method
  # on the Payment_Rest class by passing Payment_Rest ID
  @payment = Payment_Rest.find("PAY-0XL713371A312273YKE2GCNI")
  logger.info "Got Payment_Rest Details for Payment_Rest[#{@payment.id}]"

rescue ResourceNotFound => err
  # It will throw ResourceNotFound exception if the payment not found
  logger.error "Payment_Rest Not Found"
end
