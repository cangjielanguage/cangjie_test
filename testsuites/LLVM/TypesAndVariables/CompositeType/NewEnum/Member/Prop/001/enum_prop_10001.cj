// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan type of function body is incompatible with return type
enum A{
    a|b
    prop let c : Int64 {
       get() {}
       set(v) {}
    }
}


func main(): Int64 {
    //A.a.c
    return 0
}
