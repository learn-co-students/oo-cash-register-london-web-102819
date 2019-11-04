require "pry-nav"

class CashRegister
    attr_accessor :total 
    attr_reader :discount
    def initialize (employee_discount=nil)
        @discount=employee_discount
        @total = 0 
        @item_collection = [ ]
        @item_list = [ ]
    end

    def add_item(title, price, quantity=1)
        self.total += (price * quantity)
            quantity.times do 
                @item_collection<<title
            end
        @item_list<<{title: title, price: price, quantity: quantity}
    end
    
    def apply_discount
        if @discount != nil
        @total = total - ((discount/100.to_f)*total)
        #@total here == self.total
        "After the discount, the total comes to $#{@total.to_int}."
        else 
            "There is no discount to apply."
        end
    end

    def items 
        @item_collection
    end

    def void_last_transaction 
        @total= @total - (@item_list[-1][:price]*@item_list[-1][:quantity])
        @item_list[-1][:quantity].times do
            @item_collection.delete @item_list[-1][:title]
        end
        @item_list.delete(@item_list[-1])
    end

# binding.pry
end

