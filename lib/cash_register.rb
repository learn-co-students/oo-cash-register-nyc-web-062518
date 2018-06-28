class CashRegister

  attr_accessor :discount, :total, :items, :last

  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @items = []
    @last = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times {self.items << title}
    @last = [title, price, quantity]
  end

  def apply_discount
    if @discount
      self.total *= (1 - @discount.to_f/100)
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= @last[1] * @last[2]
    @last[2].times {self.items.pop}
    @last = []

  end


end
