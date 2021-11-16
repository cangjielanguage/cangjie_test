// DEPENDENCE: ../pkga ../cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle && %copycharjs pkga
// EXEC: %compiler %cmp_opt %n.cj pkga.%middle   -o %output
// EXEC: %run %run_opt %output %run_args

package pkg
import pkga.*


class COO {
    var time = pkga.TimeUnit.Hour
    var res: Int32
    init(){
        res = match (time) {
            case $Hour => 2
        }
    }
}

func run(): Int64 {
    var res: Int32 = COO().res
    if ( res ==  2) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
