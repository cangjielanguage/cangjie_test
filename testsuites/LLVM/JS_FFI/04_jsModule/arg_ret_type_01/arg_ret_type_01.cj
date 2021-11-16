// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix


@JsModule["./momentModule"]
foreign func moment(arg:String) : String

unsafe func main() {
  if(moment("group2")=="hhh"){
    return 0;
  }
  return 1;
}

