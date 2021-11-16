// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{
    e | e(Int64)
}

func main(): Int64 {
    var a : E = e
    match (a){
        case $e => 0
        case e(_) => 1
    }
}
