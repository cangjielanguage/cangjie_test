// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func run(): Int64 {
    var opt = Option<Int32>.Some(2)
    var tup: Int32*Option<Int32> = (1, opt)
    var opt2: Option<Int32> = tup[1]
    var res: Int32 = match opt2{
        case Some(x) => x + 2
        case $None => 0
    }
    if (res == 4){
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}