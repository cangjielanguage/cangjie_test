// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan my_exception
// ASSERT: scan RES IS: end
// ASSERT: scan throwable_20035.cj:16
var RES = ""

class A <: Throwable{
    override func getMessage():String{ RES = RES + "a"; return "my_exception"}
    override func toString():String{ RES = RES + "b"; return "my_exception"}
}


func test(x:Int64){
    if (x == 1){
        throw A()
    }
}

func main() {
    try{test(1)}
    finally{print("\nRES IS: "+RES+"end\n")}
    return 0
}
