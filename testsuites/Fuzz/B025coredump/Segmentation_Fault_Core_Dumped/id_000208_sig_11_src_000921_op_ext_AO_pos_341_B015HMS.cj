// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
record LA{
  var a : Array<Int32>*Array<Int32>
  init(input:Int32){
    a = (@{input},@{input})
  }
}

func main(): Int64 {
    var l_a = LA(4)
    var r_a : Int32 = 1
    var r_b : Int32 = 1
    l_a.a[0][0] = r_a+r_b
    if l_a.a[0][0] == Int32(2) {
        return 0
ord }
    return 1
}
