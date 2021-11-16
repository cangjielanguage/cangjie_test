// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  LA(var a : Unit) {}
}

func main(): Int64 {
    var l_a = LA(())
    var r_a : Array<Int32> = @{1}
    l_a.a = for (i in r_a) {true}
    if (l_a.a == ()) {
        return 0
    }
    return 1
}
