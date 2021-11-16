// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init

class A <: Throwable{}

class B <: Throwable{}

open class C{
    static var a : Int64 = if (true) {throw A();1} else {2}
    static var b : Int64 = 1
}

class D <: C{}

func main() {
    try{
        D();
        ()
    } catch (a:Error) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
