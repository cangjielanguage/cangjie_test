// DEPENDENCE: pkga.cj
// EXEC: %compiler %cmp_opt  %n.cj pkga.cj -o %output 2>&1 | compare %f
// ASSERT: regex-auto redefinition of declaration 'TimeUnit1'
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

package pkga

enum TimeUnit1 {
      Hour
}

func run(): Int64 {
    var time1 = TimeUnit1.Hour
    var res1: Int32 = match (time1) {
        case $Hour => 1
    }
    var time2 = TimeUnit1.Hour
    var res2: Int32 = match (time2) {
        case $Hour => 2
    }
    var res: Int32 = res1 + res2
    if ( res ==  3) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
