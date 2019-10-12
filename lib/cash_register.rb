class CashRegister
  attr_accessor :total, :discount, :items, :price, :item_price

  def initialize(discount = 0)
   @total = 0
   @discount = discount
   @items = []
   @item_price=[]
  end

  def add_item(item,price,amount=1)
    @price = price
    @total += price * amount
    @item_price << price * amount
    if amount > 1
      counter = 0
      while counter < amount
        @items << item
        
        counter += 1
      end
    else
      @items << item
    end
  end

  def apply_discount
    if @discount > 0
      @deduction = (discount * price)/100
      @total -= @deduction
      return "After the discount, the total comes to $#{total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    item_price.reverse.each do |i|
    @total -= item_price[i]
    end
    
     
  end

end
