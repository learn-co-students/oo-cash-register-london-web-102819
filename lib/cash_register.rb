class CashRegister

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @previous_total = 0
    end

    attr_accessor :discount, :total, :previous_total
    attr_reader :items

    def apply_discount
        return "There is no discount to apply." if @discount == 0
        @total *= (1 - @discount/100.0)
        @total = @total.round
        return "After the discount, the total comes to $#{@total}."
    end

    def add_item(title, price, quantity = 1)
        
        @total += price*quantity
        
        quantity.times do
            @items << title
        end

        @previous_total = @total - price*quantity
       
    end
    
    def void_last_transaction
        @total = @previous_total
    end

end





