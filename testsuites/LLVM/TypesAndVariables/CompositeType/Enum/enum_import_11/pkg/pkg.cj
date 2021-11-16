// DEPENDENCE: ../pkga ../cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %n.cj pkga.%middle   -o %output 2>&1 | compare %f
// ASSERT: scan it doesn't support importing package by package name
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

package pkg
import pkga as A


func run(): Int64 {
    var time = A.TimeUnit.Hour
    var res: Int32 = match (time) {
        case $Hour => 2
    }
    if ( res ==  2) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
