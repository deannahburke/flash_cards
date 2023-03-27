class Round
    attr_reader :deck,
                :turns

    def initialize(deck)
        @deck = deck 
        @turns = []
    end

    def current_card
        @deck.cards.first
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns.push(turn)
        @turns.first
        require 'pry'; binding.pry
    end

    def number_correct
        #add correct and incorrect arrays to attributes, just count in number correct and add helper method to add guesses to incorrect or correct array
        correct = []
        incorrect = []
        if @turns.first.correct? 
            correct << @turns.first
        else
            incorrect << @turns.first
        end
        correct.length
    end
end