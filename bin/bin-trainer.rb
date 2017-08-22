#!/usr/bin/env ruby
# encoding: UTF-8

require "colorize"

$max_word_length = 4
$symbols = ["0", "1"]
$correct = 0
$wrong = 0

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
    puts "\n=================="
    puts "What is it? #{number}"
    answer = gets
    if answer.to_i == number.to_i($symbols.length)
      puts "Correct !".colorize(:green)
      $correct += 1
    else
      puts "Wrong! It is ".colorize(:red) + "#{number.to_i(2)}".colorize(:green)
      $wrong += 1
    end
  end
end

def print_stats
  puts "\n\nYou got " + $correct.to_s.colorize(:green) + " correct and " + \
    $wrong.to_s.colorize(:red) + " wrong"
end

if __FILE__ == $PROGRAM_NAME
  Signal.trap('INT') do
    print_stats
    puts "\nI'm getting you outta here"
    exit 0
  end
  puts "Binary trainer"
  main
end

#vim-run: ruby %
