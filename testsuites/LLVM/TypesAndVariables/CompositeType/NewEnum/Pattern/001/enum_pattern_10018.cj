// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum E{
    x | y(Int64)
}

func main(): Int64 {
    var a : E = x
    let x : E = y(1)
    match (a){
        case $x => 0 // EXPECTED: regex no overloaded '==' function in match case pattern
        case y(_) => 1
    }
}
