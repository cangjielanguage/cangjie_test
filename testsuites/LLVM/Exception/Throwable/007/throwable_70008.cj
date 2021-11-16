// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan finally!success

class A <: Throwable{}
class B <: Throwable{}


func test(){
    var i = 0
    while (i!=10){
        i++
        try{ continue }
        finally { print("finally!") }
    }
    return i
}


func main() {
    var res = test()
    print("success, ${res}\n")
    return res - 10
}
