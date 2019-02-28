require 'fileutils'
# module FixtureHandler
module FixtureHandler
  def self.clear_fixtures
    FileUtils.rm_rf(fixtures_dir)
  end

  def self.create_fixture_dir
    FileUtils.mkdir(fixtures_dir)
  end

  def self.write_fixture(index, text)
    File.open(fixture_path(index), 'w') do |file|
      file.write(text)
    end
  end

  def self.fixture_exists?(index)
    File.exist?(fixture_path(index))
  end

  def self.read_fixture(index)
    File.read(fixture_path(index))
  end

  def self.fixture_path(index)
    "#{fixtures_dir}/#{index}.txt"
  end

  def self.fixtures_dir
    "#{__dir__}/fixtures"
  end
end
