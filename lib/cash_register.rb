require 'pry'

class CashRegister

  attr_accessor :total
  attr_reader :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    quantity.times do
      @items << title
    end
    item_price = price * quantity
    self.total += item_price
  end

  def new_total
    self.total - (self.total * self.discount / 100)
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      self.total = new_total
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
    self.total = 0

  end

end
