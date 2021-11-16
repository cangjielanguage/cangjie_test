// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ab
// ASSERT: scan throwable_20012.cj:13
class A <: Throwable{
    override func getMessage():String{ return "a"}
    override func toString():String{ return "b"}
}


class B{
    init(){
        throw A()
    }
}

func main() {
    var a = A()
    var res = 3
    try{
        B()
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
