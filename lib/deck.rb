class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def count
        @cards.length
    end

    def cards_in_a_category(category)
        alike_cards = []
        @cards.map do |card|
                if card.category == category 
                    alike_cards << card
                end 
            end 
        alike_cards
    end
end 