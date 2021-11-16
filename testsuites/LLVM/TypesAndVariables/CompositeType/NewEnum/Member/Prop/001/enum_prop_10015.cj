// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan type of function body is incompatible with return type

enum A<T>{
    a(T,T,T)

    prop var c : Int64 {
       get() {}
       set(v){}
    }
}


func main(): Int64 {
    var i = A.a(1,2,3)
    return 0
}
