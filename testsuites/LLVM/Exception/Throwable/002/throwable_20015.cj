// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ab
// ASSERT: scan throwable_20015.cj:18
class A <: Throwable{
    override func getMessage():String{ return "a"}
    override func toString():String{ return "b"}
}


class B{}

var res = 3

extend B{
    func test(){
        res = 5
        throw A()
    }
}

func main() {
    var a = A()

    try{
        B().test()
    }
    catch (e:A){
        print(e.getMessage())
        print(e.toString())
        e.printStackTrace()
        if (res != 5) {
            throw A()
        }
        return res
    }
    finally{res = 0;return res}
    res = 4
    return res
}
