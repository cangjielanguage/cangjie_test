// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan my_exception
// ASSERT: scan throwable_20021.cj:14
class A <: Throwable{
    override func getMessage():String{ return "my_exception"}
    override func toString():String{ return "my_exception"}
}

record B{
    static var b = test(1)
    static func test(x:Int64){
        if (x == 1){
            throw A()
        }
        return x
    }
}

func main() {
    var a = A()
    try{
        B.b;
        ()
    }
    catch (e:A){
        print(e.getMessage())
        print(e.toString())
        e.printStackTrace()
    }
    return 0
}
