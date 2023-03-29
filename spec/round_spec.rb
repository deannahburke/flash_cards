require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do 
    it 'exists with attributes' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
            
        expect(round).to be_a Round
        expect(round.deck).to eq(deck)
        expect(round.turns).to eq([])
    end

    it 'returns the current card' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.current_card).to eq(card_1)
    end

    it 'can take a turn' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn.class).to eq Turn 
        expect(new_turn.correct?).to eq true
        expect(round.turns).to eq([new_turn])
        expect(round.number_correct).to eq(1)
        expect(round.current_card).to eq(card_2)
    end

    it 'can sort correct or incorrect answers' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")
        
        expect(round.correct).to eq([new_turn])
        expect(round.incorrect).to eq([])
        expect(round.correct.length).to eq(1)
        expect(round.incorrect.length).to eq(0)
    end

    it 'can take another turn' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        turn_1 = round.take_turn("Juneau")
        turn_2 = round.take_turn("Venus")
    
        expect(round.turns.count).to eq(2)
        expect(round.turns.last.feedback).to eq("Incorrect.")
        expect(round.number_correct).to eq(1)
    end

    it 'can sort correct by category' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        turn_1 = round.take_turn("Juneau")
        turn_2 = round.take_turn("Venus")

        expect(round.number_correct_by_category(:Geography)).to eq(1)
        expect(round.number_correct_by_category(:STEM)).to eq(0)
    end

    it 'can calculate the percent correct for the whole round' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        turn_1 = round.take_turn("Juneau")
        turn_2 = round.take_turn("Venus")

        expect(round.percent_correct).to eq(50.0)
    end

    it 'can calculate the percent correct by category' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Where is Bolivia located?", "South America", :Geography)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        turn_1 = round.take_turn("Juneau")
        turn_2 = round.take_turn("Venus")
        turn_3 = round.take_turn("Africa")

        expect(round.percent_correct_by_category(:Geography)).to eq(50.0)
        expect(round.percent_correct_by_category(:STEM)).to eq(0.0)
    end
end