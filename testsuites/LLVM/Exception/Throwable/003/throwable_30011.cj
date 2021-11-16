// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception in thread "main" default.A|An exception has already occurred
// ASSERT: scan throwable_30011.cj:9
class A <: Throwable{}

func foo(){
    func bar(){
        throw A()
    }
    bar()
}

func main() {
    foo()
    return 5
}
