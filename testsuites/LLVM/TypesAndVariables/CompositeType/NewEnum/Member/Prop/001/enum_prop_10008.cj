// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a(Int64,Int64,Int64)

    static prop let c : Int64 {
       get() {
            return 1
       }
    }
}


func main(): Int64 {
    return A.c - 1
}
