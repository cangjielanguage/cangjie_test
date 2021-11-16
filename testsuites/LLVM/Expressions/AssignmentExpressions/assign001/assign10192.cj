// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class LA{
  var a : Array<(Int32*Int32)>
  init(a:Int32){
    this.a = @{(a,a)}
  }
}

func main(): Int64 {
    var l_a = LA(4)
    var r_a : Int32 = 2
    l_a.a[0][0] = Int32(r_a)  // EXPECTED: regex 'tuple element' can not be assigned
    if (l_a.a[0][0] == Int32(2)) {
        return 0
    }
    return 1
}
