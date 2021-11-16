// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test
// ASSERT: scan throwable_20025.cj:20
var flag = false

class A <: Throwable{
    override func getMessage():String{ return "a"}
    override func toString():String{ return "b"}
}

class C <: Throwable{}

class B{
    func test(x:Int64){
        try{
            throw A()
        }
        catch (e:A){
            throw C()
        }
        return 0
    }
}

func main() {
    B().test(1)
}
