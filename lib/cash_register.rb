require 'pry'


class CashRegister

    attr_accessor :total, :discount, :items, :last_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        i = 0
        while i < quantity do
            self.total += price 
            self.items << title
            i += 1
            @last_item = price * quantity
        end
    end

    def apply_discount
        if @discount > 0 
            @total = @total - @total * @discount / 100
            return "After the discount, the total comes to $#{@total}."
        else 
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        if @items.count > 1 
            self.total -= @last_item
        else 
            self.total = 0.0
        end
    end

    def items
        @items
    end

    def total 
        @total 
    end

end