// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init

class A <: Throwable{}

class B <: Throwable{}

record C{
    static var a : Int64 = if (true) {throw A();1} else {1}
    static var b : Int64 = a
}


func main() {
    try{
        C();
        ()
    } catch (a:Throwable) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
