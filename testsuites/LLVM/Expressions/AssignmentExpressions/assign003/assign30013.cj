// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

record LA{
  var a : Int32*Int32
  init(input:Int32){
    a = (input,input)
  }
}
func main(): Int64 {
    var l_a = LA(4)
    l_a.a[0]++ // EXPECTED: regex 'tuple access' is unsupported for this increment or decrement expression
    if (l_a.a[0] != Int32(5)) {
        return 1
    }
    l_a.a[0]-- // EXPECTED: regex 'tuple access' is unsupported for this increment or decrement expression
    if (l_a.a[0] != Int32(4)) {
        return 2
    }
    return 0
}
