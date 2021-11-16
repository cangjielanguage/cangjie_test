// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

class C{
    private var a : Int64 = if (true) {throw A();1} else {2}
    public var b = a
}

func main() {
    try{
        C();
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
