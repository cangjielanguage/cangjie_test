// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ab
// ASSERT: scan throwable_20022.cj:15
class A <: Throwable{
    override func getMessage():String{ return "a"}
    override func toString():String{ return "b"}
}

class B{
    static var b = test(1)
    static func test(x:Int64){
        var res = 3
        try{
            throw A()
        }
        catch (e:A){
            print(e.getMessage())
            print(e.toString())
            e.printStackTrace()
            return res
        }
        finally{res = 0;return res}
        res = 4
        return res
    }
}

func main() {
    B.b
}
