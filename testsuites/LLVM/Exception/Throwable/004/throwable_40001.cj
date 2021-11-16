// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception in thread "main" default.A|An exception has already occurred
// ASSERT: scan throwable_40001.cj:8
class A <: Throwable{}

extend A{
    func test(){throw A()}
}

func main() {
    A().test()
    return 5 // throw before main.
}
