// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record LA{
  var a : Array<(Int32*Int32)>
  init(input:Int32){
    a = @{(input,input)}
  }
}
record RA{
  var a : Int32
  init(input:Int32){
    a = input
  }
}
func main(): Int64 {
    var l_a = LA(4)
    var r_a = RA(2)
    l_a.a[0][0] = r_a.a  // EXPECTED: regex 'tuple element' can not be assigned
    if (l_a.a[0][0] == Int32(2)) {
        return 0
    }
    return 1
}
