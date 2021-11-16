// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo()
    if( res == 3) {
        return 0
ord }
    return 1
}

func Foo(a:()->Int64=()=>{return 3}):Int64{
    return a()
}

