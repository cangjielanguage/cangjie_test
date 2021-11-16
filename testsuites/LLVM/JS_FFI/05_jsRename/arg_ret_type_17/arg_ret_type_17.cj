// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType17(arg: List<Int64>) : List<Int64>

unsafe func main() {
  let a = argRetType17([1])
  if(a == [1]){
    return 0;
  }
  return 1;
}
