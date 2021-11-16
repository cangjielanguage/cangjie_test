// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan finally!success, 100

class A <: Throwable{}
class B <: Throwable{}


func test(x!:Int64 = 1):Int64{
    try {
        if (x!=100){
            return test(x:x+1)
        } else {
            throw A()
        }
    } catch(_){}
    finally {
        print("finally!")
    }
    return x
}


func main() {
    var res = test()
    print("success, ${res}\n")
    return res - 100
}
