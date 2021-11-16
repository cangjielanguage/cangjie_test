// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record LA{
  var a : Unit
}

func main(): Int64 {
    var l_a = LA(a:())
    
    l_a.a = return 0    // EXPECTED: regex-not 'return' is not allowed here
    if (l_a.a == ()) {
        return 0
    }
    return 1
}
