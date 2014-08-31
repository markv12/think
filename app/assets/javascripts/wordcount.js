function calc_word_count(){
  var text;
  if ($("#entry_area").val() != ""){
    text = $("#entry_area").val().trim();
  }
  else{
    text = $("#entry_area").html().trim();
  }
  var wordcount = text.split(" ").length
  $("#wordcount_indicator").html("Words: "+wordcount);
}
if($("#entry_area").length){
  calc_word_count();

  $("#entry_area").bind('input propertychange', function() {
    calc_word_count();
  });
}
