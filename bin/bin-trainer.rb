#!/usr/bin/env ruby
# encoding: UTF-8

$max_word_length = 4
$symbols = ["0", "1"]

def get_random_non_decimal_string
  number = ""
  for i in (0..$max_word_length)
    j = Random.rand($symbols.length())
    number += $symbols[j]
  end
  return number
end

def main
  while true
    number = get_random_non_decimal_string
    puts "What is it? #{number}"
    answer = gets
    if answer.to_i == number.to_i($symbols.length)
      puts "Correct !"
    else
      puts "Shame on you! it is #{number.to_i(2)} !"
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  Signal.trap('INT') do
    puts "\nI'm getting you outta here"
    exit 0
  end
  puts "Binary trainer"
  main
end

#vim-run: ruby %
