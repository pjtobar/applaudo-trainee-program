# spec/string_calculator_spec.rb
require 'correct_answer_behavior'
describe "CorrectAnswerBehavior" do
  describe "#was_correctly_answered" do
   it "in_penalty_box has to be boolean" do
      game = CorrectAnswerBehavior.new
      expect([true,false]).to include(game.in_penalty_box[game.current_player])
    end

    it "was_correctly_answered return true" do
      expect(CorrectAnswerBehavior.new.was_correctly_answered).to eq(true)
    end
  end
  
end
