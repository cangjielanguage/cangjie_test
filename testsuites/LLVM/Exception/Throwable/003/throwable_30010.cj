// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception in thread "main" java.lang.Throwable|An exception has already occurred
// ASSERT: scan throwable_30010.cj:7
class A <: Throwable{}

func foo(x!:Int64 = {throw Throwable();1}()){
    var test = {var foo = {throw A()};foo();1}()
}

func main() {
    foo()
    return 5
}
