// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle 
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle 
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output 2>&1| compare %f

import pkga.*
import pkgb // EXPECTED: regex it doesn't support importing package by package name

func run(): Int64 {
    var timea = TimeUnit<Int32>.Hour(5)
    var resa: Int32 = match (timea) {
        case Hour(x) => 1
    }
    var timeb = pkgb.TimeUnit<Int32>.Hour(5)
    var resb: Int32 = match (timeb) {
        case Hour(x) => 2
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
