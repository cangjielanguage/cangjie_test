// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


enum D{d(Int64)|d}

enum E{e(D)|e}

func main(): Int64 {
    var a : E = e(d(1))
    match (a){
        case e($d) => 1
        case e(d(v)) => v-1
        case $e => 2
    }
}
