# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PaymentMethodsWithRangeExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/payment_methods_with_range"

  # Please use payment_methods_with_range/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    CheckoutsController.send(:include, Spree::Controllers::CheckoutsControllerLoadAvailablePaymentMethods)
    PaymentMethod.send(:include, Spree::Models::PaymentMethodWithRange)
  end
end
