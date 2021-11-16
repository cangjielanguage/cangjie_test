// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a|b
    prop let c : Int64 {
       get() {0}
    }
}


func main(): Int64 {
    var a = a
    return A.a.c + a.c
}
