// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success


class A <: Throwable{}

var test = {var foo = {throw A()};foo()}

func main() {
    try{
        test()
    } catch (a:A) {
        print("success")
        return 0
    }
    return 5
}
