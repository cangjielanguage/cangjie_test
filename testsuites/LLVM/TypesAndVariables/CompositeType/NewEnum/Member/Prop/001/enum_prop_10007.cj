// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a(Int64,Int64,Int64)

    protected prop var c : Int64 { // EXPECTED: regex 'protected' modifier is illegal for property declaration in enum body
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
