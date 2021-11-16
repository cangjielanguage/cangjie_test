// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

func test(){throw A()}

func main() {
    try{
        test() as Int64
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
