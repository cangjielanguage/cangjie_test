// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@JsMember["./momentMember"]
foreign func isMoment(arg: String) : String // EXPECTED: regex native function can only have CType args.

unsafe func main() {
  if(isMoment("group2")=="hhh"){
    return 0;
  }
  return 1;
}

