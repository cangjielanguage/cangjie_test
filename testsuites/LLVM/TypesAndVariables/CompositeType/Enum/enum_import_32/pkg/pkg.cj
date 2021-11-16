// DEPENDENCE: ../pkga ../pkgb ../cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle && %copycharjs pkga
// EXEC: %compiler %cmp_opt -c pkgb/pkgb.cj -o pkgb.%middle && %copycharjs pkgb
// EXEC: %compiler %cmp_opt %n.cj pkga.%middle pkgb.%middle   -o %output
// EXEC: %run %run_opt %output %run_args

package pkg
import pkga.*
import pkgb.*

func run(): Int64 {
    var timea = pkga.TimeUnit.Hour
    var resa: Int32 = match (timea) {
        case $Hour => 1
    }
    var timeb = pkgb.TimeUnit.Hour
    var resb: Int32 = match (timeb) {
        case $Hour => 2
    }
    if (  resa + resb ==  3) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
