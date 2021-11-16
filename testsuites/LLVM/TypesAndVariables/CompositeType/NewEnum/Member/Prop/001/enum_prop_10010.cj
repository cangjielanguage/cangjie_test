// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan 'redef' modifier is illegal for property declaration in enum body

enum A{
    a(Int64,Int64,Int64)

    redef prop var c : Int64 {
       get() {
            return 1
       }
       set(v){}
    }
}


func main(): Int64 {
    return A.c - 1
}
