// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class RA{
  var a : Int32
  init(a:Int32){
    this.a = a
  }
}
func main(): Int64 {
    var l_a : Array<(Int32*Int32)> = @{(4,4)}
    var r_a = RA(2)
    l_a[0][0] = r_a.a
    if l_a[0][0] == Int32(2) {
        return 0
ord }
    return 1
}
