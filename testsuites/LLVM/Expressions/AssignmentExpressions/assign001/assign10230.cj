// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  LA(var a : Int32) {}
}

func main(): Int64 {
    var l_a = LA(4)
    func r_a():Int32{return 2}
    l_a.a = r_a()
    if (l_a.a == Int32(2)) {
        return 0
    }
    return 1
}
