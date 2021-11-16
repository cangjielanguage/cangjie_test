// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{e(Int64)|e}

func main(): Int64 {
    var a : E = e(1)
    match (a){
        case e(x@y) => x-1
        case $e => 1
    }
}
