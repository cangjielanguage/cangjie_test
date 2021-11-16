// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  LA(var a : Int32) {}
}

func main(): Int64 {
    var l_a = LA(4)
    var r_a : Int32 = 2
    l_a.a = if (true) {r_a} else{r_a-1}
    if (l_a.a == Int32(2)) {
        return 0
    }
    return 1
}
