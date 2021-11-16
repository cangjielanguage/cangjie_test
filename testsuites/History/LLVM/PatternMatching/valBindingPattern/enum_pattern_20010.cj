// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{e(List<Int64>)|e}

func main(): Int64 {
    var a : E = e([1,1])
    match (a){
        case e(z@[x,y]) => z[0]-z[1]
        case $e => 1
    }
}
