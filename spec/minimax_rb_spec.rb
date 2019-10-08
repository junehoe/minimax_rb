require 'minimax_rb'

RSpec.describe MinimaxRB do
  it "returns available moves" do
    array = ["X", "-", "-", "-"]
    empty_marker = "-"

    expect(MinimaxRB.available_moves(array, empty_marker)).to eq([1,2,3])
  end

  it "returns the grid size (3x3, 4x4) of the board" do
    array = Array.new(9)

    expect(MinimaxRB.grid_size(array)).to eq 3
  end

  it "checks if a winning combo contains a specific marker" do
    marker_o = "O"
    o_winning_combo = ["O", "O", "O"]

    expect(MinimaxRB.marker_winning_combo?(marker_o, o_winning_combo)).to eq true
  end

  it "determines if a specific marker won" do
    marker_x = "X"
    x_winning_board = ["X", nil, nil, "X", nil, nil, "X", nil, nil]

    expect(MinimaxRB.marker_winner?(marker_x, x_winning_board)).to eq true
  end

  it "blocks the human player winning combo" do
    board = ["X", nil, nil, "O", "O", nil, nil, nil, "X"]
    maximizing_marker = "X"
    opponent = "O"
    empty_marker = nil

    expect(MinimaxRB.minimax(board, maximizing_marker, opponent, empty_marker)).to eq 5
  end

  it "goes for a win using a different empty marker" do
    board = ["X", "-", "O", "X", "O", "-", "-", "-", "-"]
    maximizing_marker = "X"
    opponent = "O"
    empty_marker = "-"
    args = {
      board: board,
      curr_player_marker: maximizing_marker,
      opponent_marker: opponent,
      empty_marker: empty_marker
    }

    expect(MinimaxRB.best_move(args)).to eq 6
  end

  it "blocks the human player winning combo" do
    board = ["X", nil, nil, "O", "O", nil, nil, nil, "X"]
    maximizing_marker = "X"
    opponent = "O"
    args = {
      board: board,
      curr_player_marker: maximizing_marker,
      opponent_marker: opponent
    }

    expect(MinimaxRB.best_move(args)).to eq 5
  end

  it "goes for column win" do
    board = ["X", nil, "O", "X", "O", nil, nil, nil, nil]
    maximizing_marker = "X"
    opponent = "O"
    args = {
      board: board,
      curr_player_marker: maximizing_marker,
      opponent_marker: opponent
    }

    expect(MinimaxRB.best_move(args)).to eq 6
  end

  it "goes for diagonal win" do
    board = ["O", nil, "X", "O", "X", nil, nil, nil, nil]
    maximizing_marker = "X"
    opponent = "O"
    args = {
      board: board,
      curr_player_marker: maximizing_marker,
      opponent_marker: opponent
    }
    expect(MinimaxRB.best_move(args)).to eq 6
  end

  it "returns true for a draw" do
    board = ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
    marker = "X"
    opponent = "O"
    empty_marker = nil

    expect(MinimaxRB.draw?(board, marker, opponent, empty_marker)).to eq true
  end

  it "returns true for a win" do
    board = ["X", "X", "X", "O", "O", nil, nil, nil, nil]
    marker = "X"
    opponent = "O"

    expect(MinimaxRB.win?(board, marker, opponent)).to eq true
  end

  it "returns true for a full board" do
    board = ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
    empty_marker = nil

    expect(MinimaxRB.board_full?(board, empty_marker)).to eq true
  end

  it "returns the rows of a board" do
    board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    expected = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]

    expect(MinimaxRB.rows(board)).to eq expected
  end

  it "returns the columns of a board" do
    board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    expected = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]

    expect(MinimaxRB.columns(board)).to eq expected
  end

  it "returns the diagonals of a board" do
    board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    expected = [[0, 4, 8], [6, 4, 2]]

    expect(MinimaxRB.diagonals(board)).to eq expected
  end

  it "with the highest score/move pair, returns the move" do
    expect(MinimaxRB.max_move({5 => 1})).to eq 5
  end

  it "with the highest score/move pair, returns the score" do
    expect(MinimaxRB.max_score({5 => 1})).to eq 1
  end
end
