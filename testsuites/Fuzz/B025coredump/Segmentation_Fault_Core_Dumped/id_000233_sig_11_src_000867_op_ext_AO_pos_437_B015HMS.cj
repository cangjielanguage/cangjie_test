// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I<T>{
    func getOption(): T
}

class Foo <: I<Option<Int32>>{
    func getOption(): Option<Int32>{
        Option<Int32>.Some(4)
    }
}

func run(): Int64 {
    var opt: Option<Int32> = Foo().getOption()
    var res: Int32 = match opt{
        case Some(x) => x + 1
        case $None => 0
    }
    if (res == 5){
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}
