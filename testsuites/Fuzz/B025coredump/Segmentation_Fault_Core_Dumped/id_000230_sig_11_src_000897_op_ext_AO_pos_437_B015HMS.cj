// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func run(): Int64 {
    var opt: Option<Int32> = Option<Int32>.Some(4)
    var opt2: Option<Option<Int32>> = Option<Option<Int32>>.Some(opt)
    var res: Int32 = match opt2 {
        case Some(x) => match x{
                case Some(x) => x
                case $None => 0
            }
        case $None => 0
    }
    if (res == 4) {
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}
