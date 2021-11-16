// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}
class B <: Throwable{}

func test(){
    var t = spawn {throw A()}
    t.getResult()
    return 10
}

func main() {
    var res = test()
    print("success")
    return res - 10
}
