// DEPENDENCE: ../pkga cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %n.cj pkga.%middle   -o %output 2>&1 | compare %f
// ASSERT: regex-auto 'TimeUnit' is not accessible in package 'pkga'
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

package pkg
import pkga.TimeUnit


func run(): Int64 {
    var time = pkga.TimeUnit.Hour
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
