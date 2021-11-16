// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func run(): Int64 {
    var res: Int32 = match Foo().opt{
        case Some(x) => x
        case $None => 0
    }
    if (res == 0){
        return 0
ord }
    return 1
}

class Foo {
    var opt: Option<Int32>
}

func main(): Int64 {
    return run()
}

