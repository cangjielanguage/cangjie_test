// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex default.*C.*test
// ASSERT: scan throwable_50041.cj:10
// ASSERT: scan throwable_50041.cj:11
class A <: Throwable{}

class B <: Throwable{}

record C{
    static func test():Int64{throw A()}
    static var c = test()
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
