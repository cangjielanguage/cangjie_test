// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success


class A <: Throwable{}

var test = {func foo(a!:Int64= if (true){throw A();0} else{1}){};foo()}

func main() {
    try{
        test()
    } catch (a:A) {
        print("success")
        return 0
    }
    return 5
}
