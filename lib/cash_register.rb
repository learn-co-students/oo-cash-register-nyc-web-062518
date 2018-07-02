require 'pry'

class CashRegister
	attr_accessor :discount, :total, :quantity, :items

	@@all

	def initialize(discount=0)
		@total = 0
		@discount = discount
		@items = []
	end

	def add_item(title, price, quantity=1)
		count = 0
		self.total += price * quantity
		 while count < quantity
		 	self.items << title
		 	count += 1
		 end
	end

	def apply_discount
		if self.discount == 0
			return "There is no discount to apply."
		else
			self.total -= self.discount.to_f / 100.to_f * self.total
			return "After the discount, the total comes to $800."
		end
	end

	def self.all
		@@all
	end

	def items
		@items
	end

	def void_last_transaction
		self.total = self.total - self.total
	end

end


cash_register = CashRegister.new()

cash_register.add_item("tomato", 1.76)

# binding.pry