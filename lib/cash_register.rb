
class CashRegister



  attr_reader :discount
  attr_accessor :total, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end


  def total
    @total
  end


  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times do
      @items << title
    end
    @last_transaction = price * quantity
  end


  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total -= (@total * @discount / 100).round
      "After the discount, the total comes to $#{@total}."
    end
  end


  def void_last_transaction
    @total -= self.last_transaction
  end


end
