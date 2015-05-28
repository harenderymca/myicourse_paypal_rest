# #Create Payment_Rest Using PayPal Sample
# This sample code demonstrates how you can process a
# PayPal Account based Payment_Rest.
# API used: /v1/payments/payment
require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

# ###Payment_Rest
# A Payment_Rest Resource; create one using
# the above types and intent as 'sale'
@payment = Payment_Rest.new({
  :intent =>  "sale",

  # ###Payer
  # A resource representing a Payer that funds a payment
  # Payment_Rest Method as 'paypal'
  :payer =>  {
    :payment_method =>  "paypal" },

  # ###Redirect URLs
  :redirect_urls => {
    :return_url => "http://localhost:3000/payment/execute",
    :cancel_url => "http://localhost:3000/" },

  # ###Transaction
  # A transaction defines the contract of a
  # payment - what is the payment for and who
  # is fulfilling it.
  :transactions =>  [{

    # Item List
    :item_list => {
      :items => [{
        :name => "item",
        :sku => "item",
        :price => "5",
        :currency => "USD",
        :quantity => 1 }]},

    # ###Amount
    # Let's you specify a payment amount.
    :amount =>  {
      :total =>  "5",
      :currency =>  "USD" },
    :description =>  "This is the payment transaction description." }]})

# Create Payment_Rest and return status
if @payment.create
  # Redirect the user to given approval url
  @redirect_url = @payment.links.find{|v| v.method == "REDIRECT" }.href
  logger.info "Payment_Rest[#{@payment.id}]"
  logger.info "Redirect: #{@redirect_url}"
else
  logger.error @payment.error.inspect
end
