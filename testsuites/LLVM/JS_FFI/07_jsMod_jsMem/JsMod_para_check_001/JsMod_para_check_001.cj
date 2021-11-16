// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@JsModule["./momentModule"] // EXPECTED: regex
foreign func moment(arg:String) : String

unsafe func main() {
  if(moment("group2")=="hhh"){
    return 0;
  }
  return 1;
}
