String capitalize(String s){
  if(s.isEmpty){
    return s;
  }
  var lower = s.toLowerCase();
  return lower[0].toUpperCase() + lower.substring(1);
}