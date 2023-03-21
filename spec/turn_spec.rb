require './lib/turn'
require './lib/card'

RSpec.describe Turn do 
    it 'exists' do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_a Turn 
    end

    it 'has attributes' do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.card).to eq(card)
        expect(turn.guess).to eq("Juneau")
    end

    it 'can determine if a guess is correct' do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to eq true 
    end

    it 'will give feedback if answer is correct' do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.feedback).to eq("Correct!")
    end

    it 'will give feedback if answer is incorrect' do 
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)

        expect(turn.feedback).to eq("Incorrect.")
    end
end