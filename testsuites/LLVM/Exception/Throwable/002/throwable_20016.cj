// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not before!
// ASSERT: regex init
// ASSERT: regex default.*B
// ASSERT: scan throwable_20016.cj:13
class A <: Throwable{}

class B{
    static var b = test(1)
    static func test(x:Int64){
        if (x == 1){
            throw A()
        }
        return x
    }
}

func main() {
    try{
        print("before!") // should not print.
        B.test(1)
        print("after!")
    }
    catch (e:A){ // will not catch
        print("catch!")
        print(e.getMessage())
        print(e.toString())
        e.printStackTrace()
    }
    return 0 // will not return 0.
}
