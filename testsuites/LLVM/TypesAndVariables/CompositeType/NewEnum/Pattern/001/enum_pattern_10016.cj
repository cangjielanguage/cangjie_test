// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum E{
    e | e(Int64)
}

func main(): Int64 {
    var a : E = e
    match (a){
        case $E.e => 0 // EXPECTED: regex expected '=>' after pattern in case body
        case e(_) => 1
    }
}
