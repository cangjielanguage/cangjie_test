// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a(Int64,Int64,Int64)

    public prop let c : Int64 {
       get() {
            match (this) {
                case a(x,y,z) => x
                case _ => 0
            }
       }
    }
}


func main(): Int64 {
    var i = A.a(1,2,3)
    return i.c - 1
}
