# Minimax Gem for Tic Tac Toe Unbeatable Player



## Install

```
gem install minimax_rb
```

## Usage

After installing the gem and verifying it appears in your Gemfile, you can `require minimax_rb` in the file you want to use it.

This gem will output the best available move given an array made up of 2 different string markers and blank spaces(configurable).

It has one method called `best_move` and it takes a hash with the following keys:
* board
* curr_player_marker
* opponent_marker
* empty_marker

### board:
An array of two different strings (ie "X" and "O") and your empty/blank spaces.
 

* Using nil as blank space
 -`["X","X","O", nil, nil, nil, "X", nil, nil]`
* Using empty string as blank space -`["X","X","", "", "O", "", "X", "", ""]`

### curr_player_marker:
Current player's marker, one of the two markers on the board. This is the player making the next move, also known as the maximizing player.

### opponent_marker:
The opponent's marker, the other marker on the board. This is the minimizing player. 


### empty_marker:
This is your empty space signifier. The module defaults to using `nil` if you do not provide one. 



Putting it all together:
 ```rb
args = {
    board: ["X","X","", "", "O", "", "X", "", ""],
    curr_player_marker: "X",
    opponent_marker: "O",
    empty_marker: ""
}
        
MinimaxRB.best_move(args)
```

### Return Value
MinimaxRB returns the index of the next best move in the provided array.






