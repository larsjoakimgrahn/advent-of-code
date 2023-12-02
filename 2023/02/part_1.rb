$data = File.readlines('input.txt')

$values = Array.new

Grab = Struct.new(:color, :amount) do 
  def fulfills_criteria
    case color 
    when 'red'
      return amount <= 12 
    when 'green'
      return amount <= 13
    when 'blue'
      return amount <= 14
    else 
      return true
    end
  end
end

$matching_games = []

$data.each do |line|
  game, all_grabs = line.strip.split(':')
  grabs = all_grabs.strip.split(';')

  result = grabs.flat_map {|grab| 
    color_grabs = grab.strip.split(',')
    color_grabs.map {|color_grab| 
      amount, color = color_grab.strip.split(' ')
      Grab.new(color, amount.to_i)
    }
  }
  if result.all? {|g| g.fulfills_criteria} 
    $matching_games.push(game.split(' ')[1].to_i)
  end
  
end

p $matching_games.sum