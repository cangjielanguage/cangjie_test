// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception in thread "main" default.A|An exception has already occurred
// ASSERT: scan throwable_40002.cj:8
class A<T> <: Throwable{}

extend A<T>{
    func test(){throw A<Int64>()}
}

func main() {
    A<Bool>().test()
    return 5 // throw before main.
}
