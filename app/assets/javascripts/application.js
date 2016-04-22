// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

/*
$( document ).ready(function() {
  humanTurn = true;
  boardArray = [ " ", " ", " ", " ", " ", " ", " ", " ", " "]
  $(".box").click(function() {

    if (humanTurn && boardArray[this.id] === " ") {
      humanTurn = false;
      $(".button").fadeOut("fast")
      boardArray[this.id] = "X"

      var data = {board: boardArray}

      displayData.dataToBoard();
      $.post( "/game", data, function( data ) {
        boardArray = data.board
        displayData.dataToBoard();

        if (data.gameover == true) {
          console.log(data.winner)
          if (data.winner == "X") {
            $("#player-win").show("slow");
          }
          else if (data.winner == "O") {
            $("#computer-win").show("slow");
          }
          else {
            $("#tie-game").show("slow");
          }
          $(".new-game").show("slow");
        }
        else {
          humanTurn = true;
        }
      });
    }
  });

  $(".button").click(function(e) {
    e.preventDefault()
    $(this).fadeOut("fast")
    $.get( "/game/new", function(data) {
      boardArray = data.board
      displayData.dataToBoard();
      humanTurn = true;
    })
  })

  $(".new-game").click(function(e) {
    e.preventDefault()
    location.reload();
  })

  var displayData = {
    dataToBoard : function() {
      for (var i = 0; i < boardArray.length; i++) {

      letter = boardArray[i]
      if (letter == " ") {
        letter = "blank"
      }

      $("#" + i + letter).show("fast");
      }
    }
  }

});
*/
