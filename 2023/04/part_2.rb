$data = File.readlines('input.txt')

$value = 0

$games = Hash.new

Card = Struct.new(:game_number, :solution) do 
  def correct_card(running_game, card_numbers)
    winning_numbers = (solution & card_numbers).size
    if (winning_numbers > 0) 
      for won_card in (running_game+1)..(running_game+winning_numbers)
        game = $games[won_card]
        if (game != nil) 
          game.cards.push(game.cards[0])
          $games[won_card] = game
        end
      end
    end
  end
end

Game = Struct.new(:game_number, :card_numbers, :cards, :amount) do 
  def play_game
    cards.each {|c| 
    c.correct_card(game_number, card_numbers)}
  end
end

$data.each do |line|
  game, row = line.split(':').map {|x| x.strip}
  solution_s, mine_s = row.split('|')
  solution = solution_s.split(' ').map {|x| x.to_i}
  mine = mine_s.split(' ').map {|x| x.to_i}
  game_number = game.split(' ')[1].to_i

  g = Game.new(game_number, mine, [Card.new(game_number, solution)], 1)
  $games[g.game_number] = g
end 


$games.size.times{ |index| 
  $games[index+1].play_game
}

p $games.values.inject(0) {|sum, game| game.cards.size + sum }