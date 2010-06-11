module Spree::Controllers::CheckoutsControllerLoadAvailablePaymentMethods
  def self.included(target)
    target.class_eval do
      def load_available_payment_methods 
        @payment_methods = PaymentMethod.available.select{|p| p.available?(@checkout.order)}
        if @checkout.payment and @checkout.payment.payment_method
          @payment_method = @checkout.payment.payment_method
        else
          @payment_method = @payment_methods.first
        end
        
        @payment_method = @payment_methods.first unless @payment_methods.include?(@payment_method)
      end
    end
  end
end