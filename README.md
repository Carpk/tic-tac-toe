# Tic-Tac-Toe

Command line game, only Ruby needs to be installed. Currently, there are 3 differant versions. Each on a seperate branch.

#### Master (in progress)

Turning the command line game version from master_original to a full web app. The game is completely functional, however some refactoring and additonal features need to be implemented

#### Master_original (completed)

The first working version. The computer AI starts on the same spot at the beginning of each game, every time.

#### Rand_start (in progress)

The first version of the game, which set the foundation on how the logic would be implemented. Each strategy will have to have a separate file. And the computer AI will choose a random starting point from certain key positions, on the board at each game start.

## Getting Started

#### Master_original

Download master_original branch, and run:

`ruby ttt.rb`

#### Master

Download master branch, and run the following commands:

`bundle`

`rake db:create`

`rake db:migrate`

`rails server`

Open up your browser and navigate to [http://0.0.0.0:3000/](http://0.0.0.0:3000/)

## Screenshots

#### Master_original

![command line version](https://raw.githubusercontent.com/Carpk/tic-tac-toe/master/app/assets/images/Screenshot%20from%202014-04-18%2019:49:07.png)

#### Master

![colorful app version](https://raw.githubusercontent.com/Carpk/tic-tac-toe/master/app/assets/images/Screenshot%20from%202014-04-20%2018:38:09.png)

## Tips

Only way to win, is not to play! :D