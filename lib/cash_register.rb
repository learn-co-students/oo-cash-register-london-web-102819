class CashRegister
    
    attr_accessor :total, :items, :item_prices, :quantity_tracker
    attr_reader :discount

    def initialize(discount=0)
        @total=0
        @discount=discount
        @items = []
        @item_prices = []
        @quantity_tracker = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        quantity.times { self.items << title }
        quantity.times { self.item_prices << price }
        quantity.times { self.quantity_tracker << quantity }
    end

    def apply_discount
        self.total = self.total * (100 - self.discount)/100
            if self.discount != 0
                "After the discount, the total comes to $#{self.total}."
            else "There is no discount to apply."
            end
    end

    def void_last_transaction
        quantity_tracker.last.times do
            self.total -= self.item_prices.last 
            self.item_prices.pop
            self.items.pop
            self.quantity_tracker.pop
        end
    end
end