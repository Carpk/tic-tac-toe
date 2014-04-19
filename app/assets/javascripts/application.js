// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
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
  humanTurn = false;
  playerTurns = [];

  $(".box").click(function() {
    // if empty and player's turn, do this...
    if (humanTurn) {
      humanTurn = false;
      playerTurns.push(this.id) // may not need array, position into session once on controller
      var data = {positions: playerTurns}
      $( this ).append( '<span class="letter-o">O</span>' );
      $.post( "/game", data, function( data ) {
        $( "#" + data.position ).append( '<span class="letter-x">X</span>' );
        console.log(data.win)
        if (data.win) {
          alert("you lose!")
          location.reload();
        }
        else {
        humanTurn = true;
        }
      });
    }
  });

  $(".button").click(function(e) {
    e.preventDefault()
    $(this).fadeOut("slow")
    $.get( "/game/new", function(data) {
    $( "#" + data.position ).append( '<span class="letter-x">X</span>' );
    humanTurn = true;
      
    })
  })

});
