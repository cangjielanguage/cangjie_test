// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test

class A <: Throwable{}

class B <: Throwable{}

record C{
    static func test(x!:Bool=if(true){throw A();true}else{true}){}
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
