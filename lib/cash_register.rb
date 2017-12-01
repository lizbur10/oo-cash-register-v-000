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
      self.total % 100 == 0 ? self.total = self.total.to_i : self.total = self.total.round!(2)
        "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.items.delete_at(self.items.length-1)
    self.total -= self.last_transaction[1]*self.last_transaction[2]
  end

end
