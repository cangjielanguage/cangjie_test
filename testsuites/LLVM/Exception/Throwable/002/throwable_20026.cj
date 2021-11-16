// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test
// ASSERT: scan throwable_20026.cj:17
class A <: Throwable{
    override func getMessage():String{ return "a"}
    override func toString():String{ return "b"}
}

class C <: Throwable{}

func test(){
    try{
        throw A()
    }
    catch (e:A){
        throw C()
    }
}


func main() {
    test()
    return 0
}
