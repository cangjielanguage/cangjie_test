// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a(Int64,Int64,Int64)
    prop let b : Int64{ // EXPECTED: regex 'let' property cannot have setter
       get(){1}
       set(v){}
    }
}


func main(): Int64 {
    var i = a(1,2,3)
    return i.b
}
