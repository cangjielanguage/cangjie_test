// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a(Int64,Int64,Int64)
    prop let b : Int64{
       get(){0}
    }
}

func main(): Int64 {
    var i = a(1,2,3)
    return i.b
}
