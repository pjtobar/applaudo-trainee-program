# main_simulation.rb
require_relative 'correct_answer_behavior'

SIMULATIONS_COUNT = 5000
def run_simulation(index = nil)
  CorrectAnswerBehavior.new(index).was_correctly_answered
end

def capture_simulation_output(index)
  StdOutToStringRedirector.redirect_stdout_to_string do
    run_simulation(index)
  end
end

def clean_fixtures
  FixtureHandler.clear_fixtures
end

def record_fixtures
  SIMULATIONS_COUNT.times do |index|
    raise 'You need to clean recorded simulation results first!' if FixtureHandler.fixture_exists?(index)
  end
  FixtureHandler.create_fixture_dir
  SIMULATIONS_COUNT.times do |index|
    FixtureHandler.write_fixture(index, capture_simulation_output(index))
  end
rescue RuntimeError => e
  puts 'ERROR!!!'
  puts e.message
end

require 'test/unit/assertions'
include Test::Unit::Assertions
def test_output
  SIMULATIONS_COUNT.times do |index|
    raise 'You need to record simulation results first!' unless FixtureHandler.fixture_exists?(index)

    assert_equal(FixtureHandler.read_fixture(index), capture_simulation_output(index))
  end
  puts 'OK.'
rescue RuntimeError => e
  puts 'ERROR!!!'
  puts e.message
end

case ARGV[0].to_s.downcase
when '-h', '--help', 'help'
  puts 'Usage:'
  puts "  ruby #{__FILE__} [-h|--help|help]       - shows help screen."
  puts "  ruby #{__FILE__} [-c|--clean|clean]     - clean recorded results of simulation."
  puts "  ruby #{__FILE__} [-r|--record|record]   - records #{SIMULATIONS_COUNT} results of simulation."
  puts "  ruby #{__FILE__} [-t|--test|test]       - tests against #{SIMULATIONS_COUNT} recorded results of simulation."
  puts "  ruby #{__FILE__} <ANY_NUMBER>           - shows result of simulation initialized with <ANY_NUMBER>."
  puts "  ruby #{__FILE__}                        - shows result of random simulation."
when '-c', '--clean', 'clean'
  clean_fixtures
when '-r', '--record', 'record'
  record_fixtures
when '-t', '--test', 'test'
  test_output
when /\d(.\d+)?/
  run_simulation ARGV[0].to_f
else
  run_simulation
end
