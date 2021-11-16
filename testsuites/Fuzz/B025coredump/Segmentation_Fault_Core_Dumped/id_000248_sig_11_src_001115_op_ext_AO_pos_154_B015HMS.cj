// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
record LA{
  var a : Unit
}

func main(): Int64 {
    var l_a = LA(())
ord 
    l_a.a = ()
    if l_a.a == () {
        return 0
    }
    return 1
}
