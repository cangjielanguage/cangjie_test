// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a(Int64) | a
    operator func ()(x:Int64) {0}
}

func main(): Int64 {
    var x : A = a(1) // will not go operator func ()
    return 0
}
