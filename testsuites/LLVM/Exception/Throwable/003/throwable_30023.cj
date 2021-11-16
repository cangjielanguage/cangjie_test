// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

var a = {x:Int64 => if (x==0) {throw A();1} else {2}}
var b = {x:Int64 => a(x-1)}
var c = {x:Int64 => b(x-1)}

func main() {
    try{
        c(2)
    } catch (a:A) {
        print("success")
        a.printStackTrace()
        return 0
    }
    return 5
}
