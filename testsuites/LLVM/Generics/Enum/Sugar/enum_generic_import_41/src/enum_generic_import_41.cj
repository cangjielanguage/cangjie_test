// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*
import pkgb.*

func run(): Int64 {
    var timea = pkga.TimeUnit.Hour(5)
    var resa = match (timea) {
        case Hour(x) => 1
    }
    var timeb = pkgb.TimeUnit.Hour
    var resb = timeb
    if (resa + resb == 3) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
