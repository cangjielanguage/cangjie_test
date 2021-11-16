// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
record LA{
  var a : Array<(Unit*Unit)>
  init(input:Unit){
    a = @{(input,input)}
  }
}

func main(): Int64 {
    var l_a = LA(())

    l_a.a[0][0] = ()
    if l_a.a[0][0] == ():{
        return 0
    }
    return 1
}
