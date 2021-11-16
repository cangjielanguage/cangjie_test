// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}
class B <: Throwable{}

func foo(x!:Int64 = {throw A();1}()){
    var test = {var foo = {throw B()};foo();1}()
}


func main() {
    try{
        foo()
    } catch (a:A) {
        print("success")
        return 0
    }
    return 5
}
