class Round
    attr_reader :deck,
                :turns,
                :correct,
                :incorrect

    def initialize(deck)
        @deck = deck 
        @turns = []
        @correct = []
        @incorrect = []
    end

    def current_card
        @deck.cards.first
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns.push(turn)
        sort_correct(turn)
        @deck.cards.shift
        @turns.first
    end

    def sort_correct(turn)
        if turn.correct? 
            @correct << turn
        else
            @incorrect << turn
        end
    end

    def number_correct
        @correct.length
    end

    def number_correct_by_category(category) 
        @correct.find_all { |turn| turn.card.category == category }.count
    end
end