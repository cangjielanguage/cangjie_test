// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{
    x | y(Int64)
}

func main(): Int64 {
    var a : E = x
    var x : Int64 = 1
    match (a){
        case $x => 0
        case y(_) => 1
    }
}
