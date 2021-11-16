// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a
    prop var c : Int64 {
       get() {0}
       set(v){}
    }
}


func main(): Int64 {
    var i = A.a
    i.c = [1] // EXPECTED: regex type incompatible in this assignment
    return i.c
}
