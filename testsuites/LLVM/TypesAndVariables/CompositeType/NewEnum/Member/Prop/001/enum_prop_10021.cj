// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan unable to infer property return type, please write it

enum A{
    a(Int64,Int64,Int64)
    prop var a {
       get( ){1}
       set(v){ }
    }
}


func main(): Int64 {
    var i = A.a(1,2,3)
    return i.a - 1
}
