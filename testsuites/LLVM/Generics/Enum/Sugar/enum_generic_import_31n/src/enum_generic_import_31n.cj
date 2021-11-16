// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle  -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

import pkga.TimeUnit
import pkgb.TimeUnit

func run(): Int64 {
    var time = TimeUnit.Hour(5) // EXPECTED: regex there occurs type ambiguity about enum_decl on imported declaration 'TimeUnit'
    var res: Int32 = match (time) {
        case Hour(x) => 2
    }
    if (  res ==  2) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
