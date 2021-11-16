// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a(Int64)
    operator func +(y:A):Int64{0}
}


func main(): Int64 {
    var x : Int64 = A.a(1)+A.a(1)
    return 0
}
