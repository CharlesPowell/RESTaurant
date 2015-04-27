class Order < ActiveRecord::Base
    belongs_to(:party)
    belongs_to(:foods)

    def total
      @total
    end

    def party_id
      @party_id
    end

    def paid
      @paid
    end

    # def add_food(q, p)
    #   this.total += (q * p)
    # end
end
