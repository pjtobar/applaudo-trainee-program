# spec/string_calculator_spec.rb
require 'correct_answer_behavior'
describe "CorrectAnswerBehavior" do
  describe "#was_correctly_answered" do
    it "in_penalty_box has to be boolean" do
      game = CorrectAnswerBehavior.new
      expect([true, false]).to include(game.instance_variable_get(:@in_penalty_box)[game.instance_variable_get(:@current_player)])
    end

    it "was_correctly_answered return true" do
      expect(CorrectAnswerBehavior.new.was_correctly_answered).to eq(true)
    end

    it "if is not is_getting_out_of_penalty_box purses must not increase" do
      game =  CorrectAnswerBehavior.new
      current_player = game.instance_variable_get(:@current_player)
      purses = game.instance_variable_get(:@purses)[current_player]
      value = false
      is_in_penalty(game, value)
      game.was_correctly_answered
      # puts "despues #{game.instance_variable_get(:@purses)}"
      expect(game.instance_variable_get(:@purses)[current_player]).to eq(purses)
    end

    it "if is_getting_out_of_penalty_box purses must increase by 1" do
      game =  CorrectAnswerBehavior.new
      current_player = game.instance_variable_get(:@current_player)
      purses = game.instance_variable_get(:@purses)[current_player]
      value = true
      is_in_penalty(game, value)
      game.was_correctly_answered
      # puts "despues #{game.instance_variable_get(:@purses)}"
      expect(game.instance_variable_get(:@purses)[current_player]).to eq(purses + 1)
    end
  end
  describe "#check_current_player" do
    it "was_correctly_answered must return true whith method check_current_player" do
      check_current_player = double("check_current_player")
      allow(CorrectAnswerBehavior).to receive(:check_current_player)
      expect(CorrectAnswerBehavior.new.was_correctly_answered).to eq(true)
    end

    it "current_player must change to zero when is the last one" do
      game = CorrectAnswerBehavior.new
      game.instance_variable_set(:@current_player, game.instance_variable_get(:@players).length-1)
      expect(game.check_current_player).to eq(0)
    end

    it "current_player must increase by 1 when not is the last one" do
      game = CorrectAnswerBehavior.new
      game.instance_variable_set(:@current_player, rand(game.instance_variable_get(:@players).count - 1))
      player = game.instance_variable_get(:@current_player)
      expect(game.check_current_player).to eq(player + 1)
    end
  end
  describe "#check_correct_answer" do
    it "was_correctly_answered must return true with method check_correct_answer" do
      check_correct_answer = double("check_correct_answer")
      allow(CorrectAnswerBehavior).to receive(:check_correct_answer)
      expect(CorrectAnswerBehavior.new.was_correctly_answered).to eq(true)
    end

    it "purses must increase by 1" do
      game = CorrectAnswerBehavior.new
      purses = game.instance_variable_get(:@purses)[game.instance_variable_get(:@current_player)]
      expect(game.check_correct_answer).to eq(purses + 1)
    end
  end
end

def is_in_penalty (game, value)
  array = game.instance_variable_get(:@in_penalty_box)
  index = game.instance_variable_get(:@current_player)
  array[index] = true
  game.instance_variable_set(:@in_penalty_box, array)
  game.instance_variable_set(:@is_getting_out_of_penalty_box, value)
end
