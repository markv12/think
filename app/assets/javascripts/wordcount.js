function calc_word_count(){
  var text;
  if ($("#entry_area").val() != ""){
    text = $("#entry_area").val().trim();
  }
  else{
    text = $("#entry_area").html().trim();
  }
  var split_string = text.split(' ');
  var wordcount
  if(split_string.length == 1 && split_string[0] == ""){
    wordcount = 0
  }
  else{
    wordcount = split_string.length
  }
  $("#wordcount_indicator").html("Words: "+wordcount);
}
//alert("Here: "+$("#entry_area").length)
$(function() {
  if($("#entry_area").length){
    calc_word_count();

    $("#entry_area").bind('input propertychange', function() {
      calc_word_count();
    });
  }
});

