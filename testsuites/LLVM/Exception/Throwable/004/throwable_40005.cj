// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init
// ASSERT: regex test
// ASSERT: scan throwable_40005.cj:10
class A <: Throwable{}
class B <: Throwable{}

extend A{
    func test(){throw B()}
}

func main() {
    A().test()
    return 5 // throw before return.
}
