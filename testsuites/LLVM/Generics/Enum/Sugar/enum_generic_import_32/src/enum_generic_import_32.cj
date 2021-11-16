// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle  -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not Generate module error

import pkga.*
import pkgb.*

func run(): Int64 {
    var timea = pkga.TimeUnit<Int64>.Hour(4)
    var resa = match (timea) {
        case Hour(x) => 1
    }
    var timeb = pkgb.TimeUnit<Int64>.Hour(6)
    var resb = match (timeb) {
        case Hour(x) => 2
    }
    if (resa + resb == 3) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
