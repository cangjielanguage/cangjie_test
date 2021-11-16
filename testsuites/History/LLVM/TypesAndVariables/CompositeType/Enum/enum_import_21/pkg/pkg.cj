// DEPENDENCE: ../pkga ../cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga/pkga.o
// EXEC: %compiler %cmp_opt %n.cj pkga/pkga.o -import-config  cfg-ast -o %output
// EXEC: %run %run_opt %output %run_args

package pkg
import pkga.TimeUnit

interface TimeUnit {
    let Hour: Int32 = 3
}

func run(): Int64 {
    var timea = pkga.TimeUnit.Hour
    var res = TimeUnit.Hour
    var resa: Int32 = match timea {
        case $Hour => 2
    }
    if (  res + resa ==  5) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
