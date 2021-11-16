// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  LA(var a : Int32) {}
}
func main(): Int64 {
    var l_a = LA(4)
    l_a.a++
    if (l_a.a != Int32(5)) {
        return 1
    }
    l_a.a--
    if (l_a.a != Int32(4)) {
        return 2
    }
    return 0
}
