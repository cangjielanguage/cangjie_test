// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a(Int64,Int64,Int64)
    prop var b : Int64{
       get(){1}
       set(v){}
       test(){} // EXPECTED: regex illegal prop member in prop block
    }
}


func main(): Int64 {
    var i = a(1,2,3)
    return 0
}
