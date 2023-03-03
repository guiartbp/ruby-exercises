class Game
    
    def initialize 
        @options = [1,2,3,4,5,6,7,8,9]
    end

    def construct
        grid = @options.length - 1

        # ( 0.. 9).each do |i|
        #     puts "#{@options[i]}"
        # end
        puts "
               #{@options[0]} | #{@options[1]} | #{@options[2]} 
              ---+---+---
               #{@options[3]} | #{@options[4]} | #{@options[5]} 
              ---+---+---
               #{@options[6]} | #{@options[7]} | #{@options[8]}
            "
    end

    def att_grid (weapon, position)
        if @options[position].is_a? Integer
            @options[position] = weapon
            self.construct
            self.check_win(weapon)
        end
    end

    def check_win (weapon)
        possibilities = [
                          [0,1,2], [3,4,5], [6,7,8],
                          [0,3,6], [1,4,7], [2,5,8],
                          [0,4,8], [2,4,6]
                        ]
        
        possibilities.each do |possible|
            win = false  
            possible.each do |poss|
                
                if @options[poss] == weapon
                    win = true
                    # puts "#{poss} - #{possible}"
                    # puts "#{@options[poss]} - #{poss} - #{possible}" 
                    
                else
                    win = false
                    break
                end
            end
            if win
                return true
            end
        end
        
        return false
    end

end

class Person
    attr_accessor :name, :weapon
    
    def initialize (name, weapon)
        @name = name
        @weapon = weapon
    end

end

game = Game.new

puts "Enter player 1 name"
name_one = gets.chomp
puts "Enter player 2 name"
name_two = gets.chomp

winner = '' 

player_one = Person.new(name_one, "x")
player_two = Person.new(name_two, "o")

game.construct
i = 9
while i > 0
    puts "#{player_one.name}, choose a space empty"
    choose = gets.to_i - 1
    weapon = player_one.weapon
    game.att_grid(weapon, choose) 
    if game.check_win(weapon) == true
        print "#{player_one.name} WIN!"
        break
    end

    i -= 1
    if i == 0
        break
    end
    puts "#{player_two.name}, choose a space empty"
    choose = gets.to_i - 1
    weapon = player_two.weapon
    game.att_grid(weapon, choose)
    if game.check_win(weapon) == true
        print "#{player_two.name} WIN!"
        break
    end
    i -= 1
    print i

end
if game.check_win(weapon) == false
    print "Draw"
end