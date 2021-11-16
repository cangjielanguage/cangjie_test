// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record A{
  A(var a : Int32) {}
}

func main(): Int64 {
    var l : A = A(1)
    var r : A = A(2)
    var temp = r
    l = temp
    if (l.a == r.a) {
        return 0
    }
    return 1
}
