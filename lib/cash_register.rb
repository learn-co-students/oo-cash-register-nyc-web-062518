require 'pry'
class CashRegister
  attr_accessor :total, :discount, :price, :quantity, :item_list, :last_transaction
  attr_reader :item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @item_list = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
      item_list << title
    end
    self.last_transaction = price * quantity
  end

  def apply_discount
    if @discount > 0
      self.total = ((100.0 - @discount)/100.0)* self.total
      return "After the discount, the total comes to $#{self.total.round}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @item_list
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end

end
