// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  LA(var a : Bool) {}
}

func main(): Int64 {
    var l_a = LA(false)
    var r_a = true
    var r_b = true
    l_a.a = r_a && r_b
    if (l_a.a == true) {
        return 0
    }
    return 1
}
