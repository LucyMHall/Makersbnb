'use strict'

function Spaces(){};

  Spaces.prototype.addSpaces = function(spaces){
    this.spaces = spaces
  };


  Spaces.prototype.printSpaces = function(spaces){
    for (var i = 0; i < spaces.length; i++) {
      $('#space_listing').append("<h1>" + spaces[i]["name"] + "</h>\
      <p>" + spaces[i]["description"] + " £" + spaces[i]["price"] + "</p> \
      <a href=\"space/"+ spaces[i]["id"] + "\"><button type=\"button\">Details</button></a>");
   }
  }


  Spaces.prototype.filter_spaces = function(date_from, date_to, spaces){
    var date_from = new Date(date_from);
    var date_to = new Date(date_to);
    console.log(date_from + date_to);
  
  }


