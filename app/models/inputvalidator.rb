class InputValidator

  def self.valid_hash?(players_hash)

    valid = players_hash[:player1][:symbol] != players_hash[:player2][:symbol]

    players_hash.each_value do |new_player|
      valid = false if new_player[:symbol].length != 1
      ai_activator = new_player[:ai].downcase[0]
      valid = false if ai_activator != "n" && ai_activator != "y"
    end

    valid
  end

  def self.valid_move?(availabilities, position)
    return false if position.class == String || !availabilities.include?(position - 1)
    (1..9).to_a.include?(position)
  end

end
