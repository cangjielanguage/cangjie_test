// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class LA{
  var a : Array<(Bool*Bool)>
  init(a:Bool){
    this.a = @{(a,a)}
  }
}

func main(): Int64 {
    var l_a = LA(false)
    var r_a = false
    var r_b = true
    l_a.a[0][0] = r_a ^^ r_b  // EXPECTED: regex 'tuple element' can not be assigned
    if (l_a.a[0][0] == true) {
        return 0
    }
    return 1
}
