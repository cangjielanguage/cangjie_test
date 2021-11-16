// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a(Int64,Int64,Int64)

    prop var a : Int64 { // EXPECTED: regex redefinition of declaration 'a'
       get() {1}
       set(v){}
    }
}


func main(): Int64 {
    var i = A.a(1,2,3)
    return i.a - 1
}
