require "pry"
class CashRegister

attr_accessor :discount
attr_accessor :contents
attr_accessor :total
attr_accessor :last_price

def initialize(discount=0)
  @discount = discount
  @contents = []
  @total = 0
  @last_price = 0
end

def total
  @total
end

def apply_discount
  if @discount == 0
    "There is no discount to apply."
  else
    @total = @total - @total*@discount/100
    "After the discount, the total comes to $#{@total}."
  end
end

def add_item(name, price, quantity=1)
  quantity.times do
    @contents << name
    self.total += price
  end
  @last_price = price
end

def items
  @contents
end

def void_last_transaction
  @total -= @last_price
end

end
