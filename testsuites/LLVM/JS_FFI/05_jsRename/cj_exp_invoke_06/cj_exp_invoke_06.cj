// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func cjExpInvoke06(arg: List<Int64>) : List<Int64>

unsafe func main() {
  let a = [1]

  var ii:Int64
  for (i in a){
    ii=i+1
  }

  if(ii == 2){
    return 0;
  }
  
  return 1;
}
