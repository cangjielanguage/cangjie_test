// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{e(Int64)|e}

func main(): Int64 {
    var a : E = e(1)
    let x : Int64 = 1
    match (a){
        case e(_) => x-1
        case $e => 1
    }
}
