// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I {
    let opt1 = Option<Int32>.None
    let opt2 = Option<Int32>.Some(4)
}

func run(): Int64 {
    let res1: Int32 = match I.opt1 {
        case Some(x) => x
        case $None => 0
    }
    let res2: Int32 = match I.opt2 {
        case Some(x) => x
        case $None => 0
    }

    if ( res1 == 0 && res2 == 4) {
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}
