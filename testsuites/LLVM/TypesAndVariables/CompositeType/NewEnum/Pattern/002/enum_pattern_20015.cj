// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


enum D{d(Int64)|d}

enum E{e(D)|e}

func main(): Int64 {
    var a : E = e(d(1))
    match (a){ // EXPECTED: regex all enum constructors must be covered in match
        case e($d) => 1
        case $e => 2
    }
}
