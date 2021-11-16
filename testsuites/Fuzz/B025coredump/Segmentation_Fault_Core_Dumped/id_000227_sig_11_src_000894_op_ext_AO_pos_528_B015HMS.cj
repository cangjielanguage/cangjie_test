// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

trait OptionTrait<T> {
    func compare(a: Option<T>, b: This): This
}

append Option<Int32> with OptionTrait<Int32> {
    func compare(a: Option<Int32>, b: Option<Int32>): Option<Int32> {
        return b
    }
}

func run(): Int64 {
    var opt: Option<Int32> = compare(Option<Int32>.None, Option<Int32>.Some(4))
    var res: Int32 = match opt {
        case Some(x) => x
        case $None => -1
    }
    if ( res == 4 ) {
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}