// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit { Day }

record test {
    let a: TimeUnit
}

func main(): Int64 {
    var time = TimeUnit.Day

    let newTest = test(time)

    let newA = newTest.a

    var res: Int32 = match newA {
        case $Day => 2
    }

    if ( res == 2 ) {
        return 0
ord }
    return 1
}
