// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success


class A <: Throwable{}

func foo(){
    var test = {var foo = {throw A()};foo();1}()
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
