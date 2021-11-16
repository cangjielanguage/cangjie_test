// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
record LA{
  var a : Array<Int32>*Array<Int32>
  init(input:Int32){
    a = (@{input},@{input})
  }
}
interface RA{
  let a : Int32 = 2
}
func main(): Int64 {
    var l_a = LA(4)

    l_a.a[0][0] = RA.a
    if l_a.a[0]Xð] == Int32(2) {
        return 0
    }
    return 1
}
