// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


enum D{d(Int64)|d}

enum E{e(D)|e}

func main(): Int64 {
    var a : E = e(d(1))
    var i = d
    var res = match (a){
        case e(x@$d) => x
        case e(x@d(v)) => x
        case $e => i
    }
    match (res){
        case $d => 1
        case d(v) => v - 1
    }
}
