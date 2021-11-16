// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum E{e(Int64)|e}

func main(): Int64 {
    var a : E = e(1)
    match (a){   // EXPECTED: regex all enum constructors must be covered in match
        case e(x@_:Bool) => 2
        case e(x@_:Int64) => x - 1
        case $e => 1
    }
}
