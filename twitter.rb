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
      input = gets.chomp
      parts = input.split
      command = parts[0]
      case command
      when "q" then puts "Goodbye!"
      when "t" then tweet(parts[1..-1].join(" "))
      when "dm" then dm(parts[1], parts[2..-1].join(""))
      else
        puts "Sorry, I don't know how to \"#{command}\""
      end
    end
  end

  def tweet(message)
    if message.length > 140
      puts "Tweet is longer than 140 characters"
    else
      @client.update(message)
      puts "Tweeted \"#{message}\""
    end
  end

  def dm(target, message)
    puts "Trying to send #{target} this direct message:"
    puts message
    can_i_dm = @client.friendships(target)[0][:screen_name]
    if can_i_dm == target
      tweet("d #{target} #{message}")
    else
      puts "#{target} does not follow you"
    end
  end
end

jst = Tweeter.new
jst.run
