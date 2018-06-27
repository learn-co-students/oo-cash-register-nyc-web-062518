require 'pry'
class CashRegister

  attr_accessor :total, :discount, :quantity, :item, :list, :last_transaction

  def initialize(discount = nil)
    #discount = nil sets default value to nil if no argument is passed to method
    @total = 0
    @discount = discount
    @list = []
  end

  def add_item(title, price, quantity = 1)
    @item = title
    @quantity = quantity
    @total += price * @quantity
    @quantity.times{@list.push(@item)}
    @last_transaction = price * quantity
  end

  def apply_discount
    if @discount
      @total = @total * ((100 - @discount)) /100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @list
  end

  def void_last_transaction
    #voids all transactions, how to void only previous transaction?
    # @total = 0
    # @list = []
    @total = @total - @last_transaction
  end
end
