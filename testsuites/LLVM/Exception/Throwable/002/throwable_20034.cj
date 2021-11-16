// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan my_exception
// ASSERT: scan throwable_20034.cj:19
var RES = ""

class A <: Throwable{
    override func getMessage():String{ RES = RES + "a"; return "my_exception"}
    override func toString():String{ RES = RES + "b"; return "my_exception"}
}

class B{
    var b : Int64 = 0
    init(){
        b = test(1)
    }
    func test(x:Int64){
        var res = 3
        throw A()
        return res
    }
}

func main() {
    var exit_code = B().b
    return 0
}
