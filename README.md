# Tic-Tac-Toe

[![Build Status](https://travis-ci.org/Carpk/tic-tac-toe.svg?branch=master)](https://travis-ci.org/Carpk/tic-tac-toe)

An interactive game where you play against an unbeatable computer AI. The game is deployed on heroku: [http://noughtsandcrosses.herokuapp.com/](http://noughtsandcrosses.herokuapp.com/)

## About

Runs on Ruby 2.1.1 and Rails 4.0.4. Game was developed using TDD, and best agile practices. Each user submitted move is sent to the server via Ajax request, Computer AI then uses the minimax algorithm for countering those submitted moves.

## Getting Started

Download master branch, and run the following commands:

`bundle`

`rails server`

Open up your browser and navigate to [http://0.0.0.0:3000/](http://0.0.0.0:3000/)

## Screenshots

![game shown as colorful app](https://raw.githubusercontent.com/Carpk/tic-tac-toe/master/app/assets/images/Screenshot%20from%202014-04-20%2018:38:09.png)
Game has a fun colorful interface.

![rspec files passing](https://raw.githubusercontent.com/Carpk/tic-tac-toe/master/app/assets/images/Screenshot%20from%202015-04-12%2020:56:38.png)
RSpec files passing.

## Refactor

Managed to shave of 3 seconds of the AI's initial counter move. From 4.5s down to 1.7s.

-2s  minimax terminated its recursive function if it was not possible to beat a "best case" time.

-800ms removed Marshal as a way to create a deep copy of an object.

## License

The MIT License (MIT)

>Copyright (c) [2014] [Contact@ShawnKlein.net]
>
>Permission is hereby granted, free of charge, to any person obtaining a copy
>of this software and associated documentation files (the "Software"), to deal
>in the Software without restriction, including without limitation the rights
>to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>copies of the Software, and to permit persons to whom the Software is
>furnished to do so, subject to the following conditions:
>
>The above copyright notice and this permission notice shall be included in all
>copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
>SOFTWARE.
