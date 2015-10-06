#start with a test method before anything
require './voter.rb'

class World
  attr_accessor :voters

  def initialize
    @voters = []
  end

  def main_menu
    puts "What would you like to do? 
(C)reate, (L)ist, (U)pdate, or (V)ote"
    option = "C" #gets.chomp.upcase
    case option
    when "C"
      #need a create_menu method
    when "L"
    when "U"
    when "V"
    else
    end
  end

  def create_menu
    puts "What would you like to create? 
(P)olitician or (V)oter?"
      create_option = "V" #gets.chomp.upcase
      case create_option
      when "V"
        #create voter_menu
      when "P"
      else
      end
  end

  def voter_menu
    puts "Name?"
    name = "Ed" #gets.chomp

    puts "Politics? 
(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
    politics = "L" #gets.chomp.upcase
    @voters << Voter.new(name, politics)
    #main_menu
  end

  def find_voter(name)
    @voters.select do |voter|
      voter.name == name
    end
  end
end


def test
# 	voter = Voter.new("Ed", "Liberal")
# p voter.name, voter.politics

  voters = world.voters
  voter = voters.first
  p voter.name, voter.politics

  world = World.new
  # world.main_menu

end

test