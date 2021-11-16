// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception in thread "main" default.A|An exception has already occurred

class A <: Throwable{}

var test = {var foo = {throw A()};foo();1}()

func main() {
    try{
        test
    } catch (a:A) { // throw before try.
        return 5
    }
    return 5
}
