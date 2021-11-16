// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func cjExpInvoke08(arg: List<Int64> ) : List<Int64>

unsafe func main() {
  var b:Int64
  var c:String
  var d =cjExpInvoke08([0,1,2])

  try {
    b = d[3]
  } catch (_) {
    c="catch an exception!"
    print(c)
  }
  if(c == "catch an exception!"){
    return 0;
  }
  return 1;
}
