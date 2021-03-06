# spec/correct_answer_behavior.rb
class CorrectAnswerBehavior
  # method to generate a game turn
  def was_correctly_answered
    if @in_penalty_box[@current_player] && @is_getting_out_of_penalty_box
      puts "#{@players[@current_player]} got out of penalty box"
      check_correct_answer
      did_player_win
    elsif @in_penalty_box[@current_player] && !@is_getting_out_of_penalty_box
      puts "#{@players[@current_player]} stays in penalty box"
      check_current_player
      true
    else
      check_correct_answer
      did_player_win
    end
  end

  # method to advance to the next player
  def check_current_player
    @current_player += 1
    @current_player = 0 if @current_player == @players.length
    puts "Player is now #{@players[@current_player]}"
    @current_player
  end

  # method when the answer is correct
  def check_correct_answer
    puts 'Answer was correct!!!!'
    @purses[@current_player] += 1
    current_purses = @purses[@current_player]
    puts "#{@players[@current_player]} now has #{@purses[@current_player]} Gold Coins."
    check_current_player
    current_purses
  end

  private

  # method to validate that purses is not 6
  def did_player_win
    (@purses[@current_player] != 6)
  end

  public

  # initializer method of the class
  def initialize(seed = nil)
    srand(seed) if seed
    @players = %w[Alice Bob Cecil]
    @purses = @players.map { rand(2..4) }
    @in_penalty_box = @players.map { rand(2).zero? }
    @current_player = rand(@players.count)
    @is_getting_out_of_penalty_box = @in_penalty_box[@current_player] && rand(2).zero?
  end
end
