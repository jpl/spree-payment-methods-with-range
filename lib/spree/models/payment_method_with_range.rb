module Spree::Models::PaymentMethodWithRange
  def self.included(target)
    target.preference :minimal_order_total, :integer, :default => -1
    target.preference :maximal_order_total, :integer, :default => -1
  end
  
  def available?(order)
    begin
      return true if self.preferred_minimal_order_total == -1 and self.preferred_maximal_order_total == -1
    
      (self.preferred_minimal_order_total != -1 ? order.total >= self.preferred_minimal_order_total : true) &&
      (self.preferred_maximal_order_total != -1 ? order.total < self.preferred_maximal_order_total : true)
    rescue NoMethodError => error
      true
    end  
  end
end