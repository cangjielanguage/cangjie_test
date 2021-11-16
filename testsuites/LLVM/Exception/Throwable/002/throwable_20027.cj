// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ab
// ASSERT: scan throwable_20027.cj:16
var RES = ""

class A <: Throwable{
    override func getMessage():String{ RES = RES + "a"; return "a"}
    override func toString():String{ RES = RES + "b"; return "b"}
}

class B{
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
    var exit_code = B.test(1)
    if (exit_code != 0){
        return exit_code
    }
    if (RES != "abb") {
        print("\nRES IS: "+RES+"\n")
        print("SHOULD BE: abb\n")
        return 6
    }
    return 0
}
