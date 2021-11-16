// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex-auto type incompatible in this assignment

record LA{
  var a : Array<Unit>
  init(input:Unit){
    a = {input}
  }
}

func main(): Int64 {
    var l_a = LA(())
    
    l_a.a[0] = return 0   // EXPECTED: regex-not 'return' is not allowed here
    if (l_a.a[0] == ()) {
        return 0
    }
    return 1
}
