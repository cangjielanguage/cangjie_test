// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success


class A <: Throwable{}

func test(a!:Int64= if (true){throw A();0} else{1}){}

func main() {
    try{
        test()
    } catch (a:A) {
        print("success")
        return 0
    }
    return 5
}
