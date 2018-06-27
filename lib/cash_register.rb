# Add items of varying quantities and prices
# Calculate discounts
# Keep track of what's been added to it
# Void the last transaction

class CashRegister
	
	def initialize(discount=0)
		@total = 0
		@discount = discount
		@items = []
		@prices = []
    end

    attr_reader :total, :discount, :itemName
    attr_writer :total, :itemName
  	#attr_accessor :bank_account, :hygiene

  	def add_item(itemName, price, quantity=1)
  		@total += quantity * price
  		quantity.times do
  			@items.push(itemName)
  			@prices.push(price)
  		end
  	end

  	def apply_discount
  		@total = @total - ((discount.to_f / 100) * @total)
  		if self.discount != 0 
  			"After the discount, the total comes to $#{@total.to_i}."
  		else
  			"There is no discount to apply."
  		end
  	end

  	def items
  		@items
  	end

  	def void_last_transaction
  		@total -= @prices.last
  	end
end





