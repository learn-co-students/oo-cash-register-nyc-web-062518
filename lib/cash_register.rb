class CashRegister

	attr_reader :discount, :items, :last_transaction
	attr_accessor :total

	def initialize(discount = 0)
		@total = 0
		@discount = discount
		@items = []
	end

	def add_item(title, price, quantity = 1)
		quantity.times do
			@items << title
		end
		@last_transaction = price * quantity
		@total += price * quantity
	end

	def apply_discount
		if discount == 0
			"There is no discount to apply."
		else
			@total = (@total * (100 - @discount.to_i)/100).round
			"After the discount, the total comes to $#{@total}."
		end
	end

	def void_last_transaction
		@total -= self.last_transaction
	end

end
