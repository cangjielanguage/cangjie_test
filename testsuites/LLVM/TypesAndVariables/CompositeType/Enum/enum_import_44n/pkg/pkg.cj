// DEPENDENCE: ../pkga ../pkgb ../cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %n.cj pkga.%middle pkgb.%middle   -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

package pkg
import pkga.TimeUnit
import pkgb.TimeUnit

func run(): Int64 {
    var time = TimeUnit.Hour    // EXPECTED: regex there occurs type ambiguity about (enum_decl|var_decl) (enum_decl|var_decl) on imported declaration 'TimeUnit'
    var res: Int32 = match (time) {
        case $Hour => 2
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
