class CashRegister

  attr_accessor :discount, :total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @basket = []
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
      for item in 1..quantity
        @basket << title
      end
  end

  def apply_discount
    if @discount > 0
      @total -= @discount * @total / 100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @basket
  end

  def void_last_transaction
    @total = 0

  end
end
