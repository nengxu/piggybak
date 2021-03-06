module Piggybak
  module Config
    class << self
      attr_accessor :payment_calculators
      attr_accessor :shipping_calculators
      attr_accessor :tax_calculators
      attr_accessor :default_country
      attr_accessor :activemerchant_mode
      attr_accessor :email_sender
      attr_accessor :order_cc
      attr_accessor :logging
      attr_accessor :logging_file

      def reset
        @email_sender = "support@piggybak.org"
        @order_cc = nil

        @payment_calculators = ["::Piggybak::PaymentCalculator::Fake",
                                "::Piggybak::PaymentCalculator::AuthorizeNet"]
        @shipping_calculators = ["::Piggybak::ShippingCalculator::FlatRate",
                                 "::Piggybak::ShippingCalculator::Free",
                                 "::Piggybak::ShippingCalculator::Range"]
        @tax_calculators = ["::Piggybak::TaxCalculator::Percent"]

        @default_country = "US"

        @activemerchant_mode = :production

        @logging = false
        @logging_file = "/log/orders.log"
      end
    end

    self.reset
  end
end
