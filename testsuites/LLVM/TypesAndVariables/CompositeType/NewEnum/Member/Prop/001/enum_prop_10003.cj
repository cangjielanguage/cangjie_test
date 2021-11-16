// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a
    prop let c : Int64 {
       get() {0}
    }
}


func main(): Int64 {
    return a.c
}
