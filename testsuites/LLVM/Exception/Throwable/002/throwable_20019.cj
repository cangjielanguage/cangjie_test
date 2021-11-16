// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan my_exception
// ASSERT: scan throwable_20019.cj:13
class A <: Throwable{
    override func getMessage():String{ return "my_exception"}
    override func toString():String{ return "my_exception"}
}

interface B{
    static func test(x:Int64){
        if (x == 1){
            throw A()
        }
        return x
    }
}

class C<:B{
    static var c = test(1)
}

func main() {
    var a = A()
    try{
        C.c;
        ()
    }
    catch (e:A){
        print(e.getMessage())
        print(e.toString())
        e.printStackTrace()
    }
    return 0
}
