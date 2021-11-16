// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception in thread "main" default.A|An exception has already occurred
// ASSERT: scan throwable_40003.cj:12
class A<T> <: Throwable{}

interface I<T>{
    func test(a:T):Unit
}

extend A<T> <: I<T>{
    func test(a:T){throw A<Int64>();return}
}

func main() {
    A<Int64>().test(1)
    return 5 // throw before main.
}
