class CashRegister

  attr_accessor :total, :items, :last_transaction
  attr_reader :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount.to_f
    @items = []
    @last_transaction = []
  end


  def add_item(item, item_price, quantity = 1)
    quantity.times {self.items << item}
    self.total= ( self.total += item_price*quantity )
    self.last_transaction = [item, item_price, quantity]
  end

  #!!!!!!!!! NEED TO VERIFY THAT THIS HANDLES FLOATS PROPERLY !!!!!!!!!!!!#
  def apply_discount
    if (self.discount > 0)
      self.total = ( self.total *= (100 - self.discount)/100 )
      # if self.total % 100 == 0
      #   "After the discount, the total comes to $#{self.total.to_i}."
      # else
        "After the discount, the total comes to $#{self.total.round(2)}."
      # end
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.items.delete_at(self.items.length-1)
    self.total -= self.last_transaction[1]*self.last_transaction[2]
  end

end


cash_register_with_discount = CashRegister.new(20)
cash_register_with_discount.add_item("eggs", 0.98)
cash_register_with_discount.add_item("book", 5.00, 3)
cash_register_with_discount.add_item("Lucky Charms", 4.5)
