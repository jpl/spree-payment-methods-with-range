Payment Methods With Range
========

Description
--------

This extensions allow declaring payment methods only available for a certain order amount.

I built this extension to allow having multiple contracts with payment gateways and choosing the best one (in terms of cost) depending on the order amount at checkout.

This is especially useful for payment like Paypal, who have micro-payment contracts which are very affordable under 10$ buying but very costy over.

Usage
--------

The extension adds two preference ("minimal order total" and "maximal order total") to PaymentMethod class. Those preferences are editable in admin to set what are the minimum and maximum amount for which the payment method is available.

You can disable one, or both of the limit by setting the value to -1 (null values begin impossible to set in preferences).

During checkout, the payment methods available will be filtered according the values set in those preferences.