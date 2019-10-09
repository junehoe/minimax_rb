module MinimaxRB
  ARGUMENT_MISSING_MESSAGE = "One or more missing arguments!"
  EXPECTED_ARGUMENTS = [:board, :curr_player_marker, :opponent_marker]

  def self.best_move args
    raise ArgumentError, ARGUMENT_MISSING_MESSAGE unless all_args_included?(args)
    minimax(args[:board], args[:curr_player_marker], args[:opponent_marker], args.fetch(:empty_marker, nil))
  end

  private
  def self.minimax board, marker, opponent, empty_marker, depth=0, best_score={}
    return 0 if draw?(board, marker, opponent, empty_marker)
    return -1 if win?(board, marker, opponent)

    available_moves(board, empty_marker).each do |move|
      board[move] = marker
      best_score[move] = -1 * minimax(board, opponent, marker, empty_marker, depth+1, {})
      board[move] = empty_marker
    end

    depth == 0 ? max_move(best_score) : max_score(best_score)
  end

  def self.max_move best_score
    best_score.max_by { |key, value| value }[0]
  end

  def self.max_score best_score
    best_score.max_by { |key, value| value }[1]
  end

  def self.available_moves board, empty_marker
    available_moves = []
    board.each_with_index do |cell_value, index|
      if cell_value == empty_marker
        available_moves << index
      end
    end
    available_moves
  end

  def self.marker_winning_combo? marker, board
    board.uniq.length == 1 and board.include?(marker)
  end

  def self.marker_winner? marker, board
    combos = [rows(board), columns(board), diagonals(board)]
    combos.each do |combo|
      combo.each { |line| return true if marker_winning_combo?(marker, line) }
    end
    false
  end

  def self.rows board
    board.each_slice(grid_size(board)).to_a
  end

  def self.columns board
    rows(board).transpose
  end

  def self.diagonals board
    left_diag = []
    right_diag = []
    (0...grid_size(board)).each do |i|
      left_diag.push(rows(board)[i][i])
      right_diag.push(rows(board).reverse[i][i])
    end
    [left_diag, right_diag]
  end

  def self.grid_size board
    Math.sqrt(board.length)
  end

  def self.draw? board, marker, opponent, empty_marker
    board_full?(board, empty_marker) and not win?(board, marker, opponent)
  end

  def self.win? board, marker, opponent
    marker_winner?(marker, board) or marker_winner?(opponent, board)
  end

  def self.board_full? board, empty_marker
    not board.include?(empty_marker)
  end

  def self.all_args_included? args
    (EXPECTED_ARGUMENTS - args.keys).empty?
  end
end
