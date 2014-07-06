
puts "Welcome to Black Jack ATTACK!"
puts ""
puts "Please Enter Your Name: "
player_name = gets.chomp
puts ""

play_black_jack = "y"

player_total = 0
dealer_total = 0

suit = ["D", "C", "S", "H"]
value = ["02","03","04","05","06","07","08","09","10"," J", " Q", " K", " A"]

def draw_board(c1s, c1v, c2s, c2v, cp)
  puts " #{cp}'s Cards"
  puts "_______ _______"
  puts "|     | |     |"
  puts "| #{c1s}#{c1v} | | #{c2s}#{c2v} |"
  puts "|_____| |_____|"
end

def draw_card(s, v, cp)
  puts "#{cp}'s Card"
  puts "_______"
  puts "|     |"
  puts "| #{s}#{v} |"
  puts "|_____|"
end

def get_random(a)
    a = a[rand(a.size)]
end

def get_value(v, t)
    if (v == " J") || (v == " K") || (v == " Q")
      t = t + 10
    elsif (v == " A")
      if t <= 10
        t = t + 11
      else
        t = t + 1
      end
    else
      t = t + v.to_i
    end
end

begin

  pc1s = get_random(suit)
  pc1v = get_random(value)

  pc2s = get_random(suit)
  pc2v = get_random(value)

  current_player = "#{player_name}"

  draw_board(pc1s, pc1v, pc2s, pc2v, current_player)

  player_total = get_value(pc1v, player_total) + get_value(pc2v, player_total)

  puts "Your Total is: #{player_total}"

  begin

    if player_total == 21
      puts "BLACK JACK!! You Win!"
      break
    end

    puts "Hit or Stay? (h or s)"
    hit_or_stay = gets.chomp

    if hit_or_stay == "h"
      new_card_suit = get_random(suit)
      new_card_value = get_random(value)

      draw_card(new_card_suit, new_card_value, current_player)
      player_total =  get_value(new_card_value, player_total)
    end

    if player_total > 21
      puts "#{player_name}, You Bust!"
      puts "Your Total is: #{player_total}"
      break
    elsif player_total == 21
      puts "BLACK JACK!! #{player_name}, You Win!"
      break
    end

    puts "Your Total is: #{player_total}"

  end while hit_or_stay == "h" 

  if player_total < 21
    dc1s = get_random(suit)
    dc1v = get_random(value)

    dc2s = get_random(suit)
    dc2v = get_random(value)

    current_player = "Dealer"

    draw_board(dc1s, dc1v, dc2s, dc2v, current_player)

    dealer_total = get_value(dc1v, dealer_total) + get_value(dc2v, dealer_total)

    puts "Dealer Total is #{dealer_total}"

    if dealer_total == 21
        puts "Dealer Has Black Jack! You Lose!"
    end

    begin 

      new_card_suit = get_random(suit)
      new_card_value = get_random(value)
      draw_card(new_card_suit, new_card_value, current_player)
      dealer_total = get_value(new_card_value, dealer_total)

      puts "Dealer's Total is #{dealer_total}"
      puts ""

      if dealer_total == 21
        puts "Dealer Has Black Jack! You Lose!"
        break
      elsif dealer_total > 21
        puts "Dealer Busts, You Win!"
      end
          
    end while dealer_total <= 17 

    if dealer_total > player_total
      puts "Dealer Wins!"
    else
      puts "#{player_name} Wins!"
    end
  end


  puts "#{player_name} do you want to play again? (y or n)"
  play_black_jack = gets.chomp

  player_total = 0
  dealer_total = 0

end while play_black_jack == "y"