// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expected function parameters after function name

enum A{
    a(Int64,Int64,Int64)
    prop var a : Int64{
       get( ){1}
       set( ){ }
    }
}


func main(): Int64 {
    var i = A.a(1,2,3)
    return i.a - 1
}
