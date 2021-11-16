// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a
    operator func +(y: A): A { this }
}


func main(): Int64 {
    var i = A.a
    var x : A = i + i
    return 0
}
