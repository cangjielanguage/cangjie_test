// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

interface C{
    func f(){throw A()}
}

class D <: C{}

func main() {
    try{
        D().f();
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
