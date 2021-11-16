// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum E{
    e(Int64) | e(Int64,Int64) | e(Int64,Int64,Int64)
}


func main(): Int64 {
    var a : E = e(1)
    match (a){
        case e(v1) | e(v1,v2) | e(v1,v2,v3) => v1 // EXPECTED: regex different number of variables are introduced in enum pattern
        case _ => 0
    }
}
