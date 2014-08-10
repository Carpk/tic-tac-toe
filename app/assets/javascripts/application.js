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


$( document ).ready(function() {
  humanTurn = true;
  // occupiedBoxes = []
  boardArray = [ " ", " ", " ", " ", " ", " ", " ", " ", " "]
  $(".box").click(function() {
    // console.log(this.id - 1)       //TODO remove
    if (humanTurn && boardArray[this.id - 1] === " ") {
      humanTurn = false;
      boardArray[this.id - 1] = "X"
      // console.log(boardArray)       //TODO remove
      // occupiedBoxes.push(this.id)
      var data = {board: boardArray}
      // $( this ).append( '<span class="letter" id="o">X</span>' );
      newObj.dataToBoard();
      $.post( "/game", data, function( data ) {
        boardArray = data.board
        console.log(boardArray)       //TODO remove
        newObj.dataToBoard();
        humanTurn = true;

        $( "#" + data.position ).append( '<span class="letter" id="x">O</span>' );
        if (data.win == "pc") {
          $( ".gameover" ).show( "slow" );
          $( ".message" ).append( "<center>Computer Wins!</center>" );
        }
        else if (data.win == "tie"){
          $( ".gameover" ).show( "slow" );
          $( ".message" ).append( "<center>Cat's Tie!</center>" );
          // $(".end-img").show();
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
      // console.log(boardArray)       //TODO remove
      newObj.dataToBoard();
      humanTurn = true;
    })
  })

  $(".gameover").click(function(e) {
    e.preventDefault()
    location.reload();
  })

  var newObj = {
    dataToBoard : function () {
        $( "#" + 1 ).html( '<span class="letter">' + boardArray[0] + '</span>' );
        $( "#" + 2 ).html( '<span class="letter">' + boardArray[1] + '</span>' );
        $( "#" + 3 ).html( '<span class="letter">' + boardArray[2] + '</span>' );
        $( "#" + 4 ).html( '<span class="letter">' + boardArray[3] + '</span>' );
        $( "#" + 5 ).html( '<span class="letter">' + boardArray[4] + '</span>' );
        $( "#" + 6 ).html( '<span class="letter">' + boardArray[5] + '</span>' );
        $( "#" + 7 ).html( '<span class="letter">' + boardArray[6] + '</span>' );
        $( "#" + 8 ).html( '<span class="letter">' + boardArray[7] + '</span>' );
        $( "#" + 9 ).html( '<span class="letter">' + boardArray[8] + '</span>' );
    }
  }


});
