// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record LA{
  var a : Unit*Unit
  init(input:Unit){
    a = (input,input)
  }
}

func main(): Int64 {
    var l_a = LA(())
    var r_a : Array<Int32> = @{1}
    l_a.a[0] = for (i in r_a) {true}  // EXPECTED: regex 'tuple element' can not be assigned
    if (l_a.a[0] == ()) {
        return 0
    }
    return 1
}
