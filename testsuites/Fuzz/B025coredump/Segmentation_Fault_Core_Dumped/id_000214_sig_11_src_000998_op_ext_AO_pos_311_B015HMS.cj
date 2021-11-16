// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
record LA{
  var a : Bool*Bool
  init(input:Bool){
    a = (input,input)
  }
}

func main(): Int64 {
    var l_a = LA(false)
var r_a = true
    var r_b = true
    l_a.a[0] = r_a && r_b
    if l_a.a[0] == true {
        return 0
ord }
    return 1
}
