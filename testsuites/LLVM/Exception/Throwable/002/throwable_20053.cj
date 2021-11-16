// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Throwable{}
class B <: Throwable{}
class C <: Throwable{}

var count = 0

func test(){
    var (c1,c2,f) = (0,0,0)
    try{
        try{
            throw A()
        } catch (_:B) {
            c1 = 1
        } finally {
            f = 1
            throw C()
        }
    } catch (_:C){
        c2 = 1
    }
    if (c1 == 0 && c2 == 1 && f == 1) {
        return 0
    }
    print("c1:${c1}\n")
    print("c2:${c2}\n")
    print("f:${f}\n")
    return 1
}

func main() {
    return test()
}
