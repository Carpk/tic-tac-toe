# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  humanTurn = true
  boardArray = [ " ", " ", " ", " ", " ", " ", " ", " ", " "]
  $(".box").click ->

    if humanTurn and boardArray[this.id] is " "
      humanTurn = false
      $(".button").fadeOut "fast"
      boardArray[this.id] = "X"

      data = {board: boardArray}

      displayDataToBoard()
      $.post "/game", data, (data) =>
        boardArray = data.board
        displayDataToBoard()

        if data.gameover is true
          if data.winnner is "X"
            $("#player-win").show "slow"
          else if data.winner is "O"
            $("#computer-win").show "slow"
          else
            $("#tie-game").show "slow"
          $(".new-game").show "slow"
        else
          humanTurn = true

  $(".button").click (e) ->
    e.preventDefault()
    $(this).fadeOut "fast"
    $.get "/game/new", (data) =>
      boardArray = data.board
      displayDataToBoard()
      humanTurn = true

  $(".new-game").click (e) ->
    e.preventDefault()
    location.reload()

  displayDataToBoard = ->
    for letter, i in boardArray
      do (letter, i) ->
        letter = "blank" if letter is " "
        $("#" + i + letter).show "fast"


