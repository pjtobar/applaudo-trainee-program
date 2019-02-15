require 'time'
name = "events.csv"
name_valid = nil
name_invalid = nil

#Cycle that validates the entry of the names of the resulting files
loop do
  puts "Enter the name of the file for valid dates"
  name_valid = gets.chomp + ".csv"
  puts "Enter the name of the file for invalid dates"
  name_invalid = gets.chomp + ".csv"
  if name_valid != name_invalid
    break
  else
    puts "ERROR, Enter a different name for each file"
  end
end


# Class to define colors for string
class String
  def red;            "\033[31m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
end

# Method to generate and save graphics in the file
def graph_file(name_valid,arr_pass,arr_error)
  begin
    total = arr_pass.length + arr_error.length
    percentage_valid = ((arr_pass.length.to_f/total)*100).round(2)
    percentage_invalid = ((arr_error.length.to_f/total)*100).round(2)
    file = File.open(name_valid,'a')
      file.puts
      file.puts "GRAPH"
      file.puts "╔═══════════════════════════════════════════════════════════════════"
      file.puts "║Valids: #{arr_pass.length}   #{"█"*(percentage_valid / 2)} #{percentage_valid}%"
      file.puts "║"
      file.puts "║Invalids: #{arr_error.length} #{"▓"*(percentage_invalid / 2)} #{percentage_invalid}%"
      file.puts "║           % ───│────│────│────│────│────│────│────│────│────│"
      file.puts "║               10   20   30   40   50   60   70   80   90   100"
      file.puts "╚═══════════════════════════════════════════════════════════════════"
  rescue  Exception => e
    puts "ERROR, #{e.message}"
  end
end

# Method to generate the graph of results in bash
def graph_bash(arr_pass,arr_error)
  begin
    total = arr_pass.length + arr_error.length
    percentage_valid = ((arr_pass.length.to_f/total)*100).round(2)
    percentage_invalid = ((arr_error.length.to_f/total)*100).round(2)

    print "\nGRAPH\n"
    puts "╔═══════════════════════════════════════════════════════════════════"
    print("║\n║Valids: #{arr_pass.length} \t")
    puts "█".green*(percentage_valid / 2) + "#{percentage_valid}%"
    print("║\n║Invalids: #{arr_error.length} \t")
    puts "█".red*(percentage_invalid / 2) + "#{percentage_invalid}%"
    puts "║"
    puts "║             % ───│────│────│────│────│────│────│────│────│────│"
    puts "║                  10   20   30   40   50   60   70   80   90   100"
    puts "╚═══════════════════════════════════════════════════════════════════"

  rescue  Exception => e
    puts "Error: #{e.message}"
  end
end

# Method that receives an array of valid dates to generate a file with the results.
def date_valid(name,arr)
  begin
    File.open(name,'w') do |file|
      arr.each do |a|
        file.puts a
      end
    end
  rescue Exception => e
    puts "ERROR, #{e.message}"
  end
end

# Method that receives an array of invalid dates to generate a file with the results.
def date_invalid(name,arr)
  begin
    File.open(name,'w') do |file|
      arr.each do |a|
        file.puts a
      end
    end
  rescue Exception => e
    puts "ERROR, #{e.message}"
  end
end


# Process for validating dates
begin
  count = 0
  arr_pass = []
  arr_error = []

  File.open(name,'r') do |row|
    while line = row.gets()
      begin
        count = count + 1
        arr_line = line.split(',')
        date_origin = Time.parse(arr_line[1])
        date_est = date_origin.getlocal("-05:00")
        arr_pass << date_est
      rescue ArgumentError => e
        arr_error << "#{line.chomp}, Error in line #{count} -#{e.message}"
        puts "Error in line #{count}, #{e.message}"
      end
    end
    arr_pass = arr_pass.sort
  end
rescue Errno::ENOENT => e
  puts "ERROR, #{e.message}"
end


date_valid(name_valid,arr_pass)
date_invalid(name_invalid,arr_error)
graph_file(name_valid,arr_pass,arr_error)
graph_bash(arr_pass,arr_error)
