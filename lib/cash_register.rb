class CashRegister
  attr_accessor :total, :discount
  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @item = []
    @price = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
  			@item.push(title)
  			@price.push(price)
  	end
    previous = @total
    @total += price * quantity
  end

  def apply_discount
    if @discount
      @total = @total * (100 - @discount)/100
      "After the discount, the total comes to $#{@total}."
    else
        "There is no discount to apply."
    end
  end

  def item=(item)
    @item
  end

  def items
    @item
  end

  def void_last_transaction
    @total -= @price.last
  end

end
