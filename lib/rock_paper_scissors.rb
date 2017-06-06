class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    player1_strat = player1[1]
    player2_strat = player2[1]

    valid_strat = Proc.new{|strat| strat == "R" || strat == "P" || strat == "S"}
    
    raise NoSuchStrategyError, 'Strategy must be one of R,P,S' unless valid_strat.call(player1_strat) && valid_strat.call(player2_strat)
    
    return player1 if player1_strat == player2_strat || ( player1_strat == "R" && player2_strat == "S" ) || ( player1_strat == "P" && player2_strat == "R" ) || (player1_strat == "S" && player2_strat == "P")
    
    player2
  end

  def self.tournament_winner(tournament)
    tournament_left = tournament[0]
    tournament_right = tournament[1]

    if tournament_left[0].is_a? String
      return winner(tournament_left, tournament_right)
    else
      return winner(tournament_winner(tournament_left), tournament_winner(tournament_right))
    end
  end

end
