// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  LA(var a : Unit) {}
}

func main(): Int64 {
    var l_a = LA(())
    
    l_a.a = ()
    if (l_a.a == ()) {
        return 0
    }
    return 1
}
