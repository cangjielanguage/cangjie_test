// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T>{
    a(T,T,T)

    prop var c : Int64 // EXPECTED:regex property declaration 'c' must have property body
}


func main(): Int64 {
    var i = A.a(1,2,3)
    return 0
}
