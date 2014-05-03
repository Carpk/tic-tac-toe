# Tic-Tac-Toe

Ruby on Rails tic-tac-toe game. Turned the command line game version into a full web app. The game is deployed on heroku: [http://noughtsandcrosses.herokuapp.com/](http://noughtsandcrosses.herokuapp.com/)


## Getting Started

Download master branch, and run the following commands:

`bundle`

`rake db:create`

`rake db:migrate`

`rails server`

Open up your browser and navigate to [http://0.0.0.0:3000/](http://0.0.0.0:3000/)

## Screenshots

![colorful app version](https://raw.githubusercontent.com/Carpk/tic-tac-toe/web_version/app/assets/images/Screenshot%20from%202014-04-20%2018:38:09.png)

## Branches

#### CLI_version

This is the first version of the game, and currently the only working one. Ran in the terminal, the model logic is hard coded with routes. After a few turns, the strategy is determined and that paricular hard coded strategy is executed.

#### dynamic_CLI

I came to the conclusion that hard coding the games logic wasn't the best use of Ruby. This is my attempt to have more of a dynamic game logic. This version will give the option to allow the player to choose his position first, and reduce the amount of code need to implement the game.

#### web_version

This version is on [Heroku](http://noughtsandcrosses.herokuapp.com/), and made use of CLI_version's hard coded logic to have a fully functioning web app version.