require 'rubygems'
require 'jumpstart_auth'

class Tweeter
  attr_accessor :client

  def initialize
    puts "Initializing..."
    @client = JumpstartAuth.twitter
  end

  def run
    puts "Welcome to Jearvon. Your twitter clients is rocking."
    command = ""
    while command != "q"
      printf "enter command: "
      command = gets.chomp
    end
  end

  def tweet(message)
    if message.length > 140
      puts "Tweet is longer than 140 characters"
    else
      @client.update(message)
    end
  end
end

jst = Tweeter.new
jst.run
