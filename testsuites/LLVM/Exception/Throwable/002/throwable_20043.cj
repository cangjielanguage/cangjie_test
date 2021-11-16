// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Throwable{}
class B <: Throwable{}

func test(): Int64{
    var res = 1
    try{
        spawn {
            throw A()
        }
        ()
    } catch (e:Throwable){
        res = -1
    }
    return res - 1
}

func main() {
    test()
}
