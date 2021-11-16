// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a(Int64,Int64,Int64)
    prop var b : Int64{
       get(){0}
       set(v){return 1} // EXPECTED: regex type of return expression is incompatible with return type
    }
}

func main(): Int64 {
    var i = a(1,2,3)
    return i.b
}
