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
  var playerTurns = []

  $(".box").click(function() {
    // if empty and player's turn, do this...
    playerTurns.push(this.id)
    var data = {positions: playerTurns}
    $( this ).append( '<span class="letter">O</span>' );
    $.post( "/game", data, function( data ) {
      // console.log(data)
      // $( ".result" ).html( data );
    });
  });


});
