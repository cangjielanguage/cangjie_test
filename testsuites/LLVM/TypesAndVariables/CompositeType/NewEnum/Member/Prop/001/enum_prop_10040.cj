// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    |a(Int64)
    |a(Int64,Int64)
    |a(Int64,Int64,Int64)
    |prop var b : A{ // EXPECTED: regex 'prop' is keyword not identifier, you can use '`prop`' instead
       get(){a(1,1,1)}
       set(v){}
    }
}

func main(): Int64 {
    var i = a(1,2,3)
    return 0
}
