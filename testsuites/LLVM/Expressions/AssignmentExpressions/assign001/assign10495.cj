// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class LA{
  var a : Array<(Unit*Unit)>
  init(a:Unit){
    this.a = @{(a,a)}
  }
}

func main(): Int64 {
    var l_a = LA(())
    var r_a : Array<Int32> = @{1}
    l_a.a[0][0] = for (i in r_a) {true}  // EXPECTED: regex 'tuple element' can not be assigned
    if (l_a.a[0][0] == ()) {
        return 0
    }
    return 1
}
