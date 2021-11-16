// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a(Int64,Int64,Int64)
    var b : Int64{ // EXPECTED: regex illegal enum member in enum block
       get(){1}
       set(v){}
    }
}


func main(): Int64 {
    var i = a(1,2,3)
    return 0
}
