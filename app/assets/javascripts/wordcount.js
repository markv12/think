function calc_word_count(){
  let text;
  let entry_area = document.getElementById("entry_area");
  if (entry_area.value != ""){
    text = entry_area.value.trim();
  }
  else {
    text = entry_area.innerHTML.trim();
  }
  let split_string = text.split(/\s+/).filter(function(element) {return element.length != 0});;
  let wordcount;
  if(split_string.length == 1 && split_string[0] == ""){
    wordcount = 0
  }
  else{
    wordcount = split_string.length
  }
  document.getElementById("wordcount_indicator").innerHTML = "Words: " + wordcount;
}

docReady(function() {
  let entry_area = document.getElementById("entry_area");
  if(entry_area){
    calc_word_count();
    entry_area.addEventListener('input', function() { calc_word_count(); }, false);
    entry_area.addEventListener('propertychange', function() { calc_word_count(); }, false);
  }
});

