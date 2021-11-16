// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex default.*A
// ASSERT: scan throwable_50020.cj:10
class A <: Throwable{}

class B <: Throwable{}

class C{
    static var a : Int64 = if (true) {throw A();1} else {2} // throw before main.
    static var b : Int64 = 1
}

func main() {
    try{
        C();
        ()
    } catch (a:Error) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
