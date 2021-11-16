// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  LA(var a : Int32) {}
}

func main(): Int64 {
    var l_a = LA(4)
    var r_a : Array<Int32> = @{1,1}
    l_a.a = Int32(r_a.size)
    if (l_a.a == Int32(2)) {
        return 0
    }
    return 1
}
