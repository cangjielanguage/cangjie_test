// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

record C{
    private C(var a !: Int64 = if (true){throw A()}else {1}){}

    init(x:Bool){this()}
}


func main() {
    try{
        C(true);
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
