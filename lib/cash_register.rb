require "pry"
class CashRegister

  attr_accessor :discount, :total, :items, :last_item, :last_price

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @last_price = 0
    @last_item = nil
  end

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
        self.items << item
      end
    self.last_item = item
    # quantity.times do
    #     self.last_item << item
    #   end
    self.last_price = price * quantity
  end

  def apply_discount
    if discount == nil
      "There is no discount to apply."
    else
      percentage_discount = 1 - (@discount.to_f / 100)
      self.total = self.total * percentage_discount
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.items.delete(self.last_item)
    self.total -= self.last_price
  end

  binding.pry

end
