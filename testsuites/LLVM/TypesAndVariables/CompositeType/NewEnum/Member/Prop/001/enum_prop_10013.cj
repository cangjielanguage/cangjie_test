// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{
    a(T,T,T)

    prop let c : Int64 {
       get() {1}
    }
}


func main(): Int64 {
    var i = A.a(1,2,3)
    return 0
}
