// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum E{
    e(Int64) | e(Int64,Int64)
}


func main(): Int64 {
    var a : E = e(1)
    match (a){ // EXPECTED: regex all enum constructors must be covered in match
        case e(v) => v
    }
}
