// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan 'redef' modifier is illegal for property declaration in enum body

enum A{
    a(Int64,Int64,Int64)

    redef static prop var c : Int64 {
       get() {
            match (this) {
                case a(x,y,z) => x
                case _ => 0
            }
       }
       set(v){}
    }
}


func main(): Int64 {
    var i = A.a(1,2,3)
    return i.c - 1
}
