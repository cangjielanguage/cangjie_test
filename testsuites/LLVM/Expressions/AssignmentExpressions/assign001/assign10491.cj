// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class LA{
  var a : Unit*Unit
  init(a:Unit){
    this.a = (a,a)
  }
}

func main(): Int64 {
    var l_a = LA(())
    var r_a : Int32 = 1
    l_a.a[0] = match (r_a) {case _ => ()}  // EXPECTED: regex 'tuple element' can not be assigned
    if (l_a.a[0] == ()) {
        return 0
    }
    return 1
}
