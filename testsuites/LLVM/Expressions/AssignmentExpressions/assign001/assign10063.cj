// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class RA{
  var a : Int32
  init(a:Int32){
    this.a = a
  }
}
func main(): Int64 {
    var l_a : Int32*Int32 = (4,4)
    var r_a = RA(2)
    l_a[0] = r_a.a  // EXPECTED: regex 'tuple element' can not be assigned
    if (l_a[0] == Int32(2)) {
        return 0
    }
    return 1
}
