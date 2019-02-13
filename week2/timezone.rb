require 'time'

class String
  def red;            "\033[31m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
end

def date_valid(name,arr,arr_inv)
  begin
    File.open(name+'.csv','w') do |file|
      arr.each do |a|
        file.puts a
      end
      file.puts
      file.puts "GRAPH"
      file.puts "||"
      file.puts("||Valids: #{arr.length} " + " " + "▓"*arr.length)
      file.puts "||"
      file.puts("||Invalids: #{arr_inv.length} " + "▓"*arr_inv.length)
      file.puts "||"
    end
  rescue Exception => e
    puts e.message
  end
end

def date_invalid(name,arr)
  begin
    File.open(name+'.csv','w') do |file|
      arr.each do |a|
        file.puts a
      end
    end
  rescue Exception => e
    puts e.message
  end
end


def get_date(string)
  pattern = /,/
  match = pattern.match(string)
  if match
    "#{match.post_match}"
  else
    "no match"
  end
end

def get_name(string)
  pattern = /,/
  match = pattern.match(string)
  if match
    "#{match.pre_match}"
  else
    "no match"
  end
end


begin
  count_general = 0
  arr_pass = []
  arr_error = []

  File.open('events.csv','r') do |row|
    while line = row.gets()
      begin
        count_general = count_general + 1
        arr_line = line.split(',')
        date_origin = Time.parse(arr_line[1])
        date_est = date_origin.getlocal("-05:00")
        arr_pass << date_est
      rescue Exception => e
        arr_error << line.chomp + "," + "Error in line #{count_general} -#{e.message}"
        puts "Error in line " + count_general.to_s + " " + e.message.to_s
      end
    end
  end
rescue Exception => e
  puts "error no se encuentra el archivo #{e.message}"
end
arr_pass = arr_pass.sort

date_valid("valids",arr_pass,arr_error)
date_invalid("invalids",arr_error)


print "\nGRAPH\n"
puts "------------------------------------------------------------------------"
print("\nValids: #{arr_pass.length} \t")
puts "▓".green*arr_pass.length
print("\nInvalids: #{arr_error.length} \t")
puts "▓".red*arr_error.length
