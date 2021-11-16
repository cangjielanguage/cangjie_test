// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

enum C{
    e
    func test(){throw A()}
}

func main() {
    try{
        C.e.test();
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
