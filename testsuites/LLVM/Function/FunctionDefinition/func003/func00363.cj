// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record A{
    A(var a : Int64) {}
}


func test(a : A): A {
    return a
}

func main(): Int64 {
    var a = A(1)
    return 0
}
