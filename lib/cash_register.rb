class CashRegister

  attr_accessor :total, :items, :last_transation_amount
  attr_writer :discount

  def initialize(employee_discount = 0)
    @total = 0
    @discount = employee_discount
    @items = []
  end

  def add_item(item_name, price, quantity = 1)
    @total += price * quantity
    @items.concat([item_name] * quantity)
    @last_transation_amount = price * quantity
  end

  def discount
    @discount
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      discount = @discount.to_f/100
      @total = @total - (@total * discount)
      "After the discount, the total comes to $#{@total.round}."
    end
  end

  def void_last_transaction
    @total = @total - @last_transation_amount
  end

end
