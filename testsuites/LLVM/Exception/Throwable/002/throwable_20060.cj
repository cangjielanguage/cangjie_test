// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A <: Throwable{}
open class B <: A{}
class C <: B{}

var res = 0b0000

func test(){
    try {
        throw C()
        res |= 0b0001
    } catch (a:Throwable) {
        res |= 0b0010
        throw B()
    }
}

func foo(){
    try{
        test()
        res |= 0b0100
    } catch (e:Throwable){
        if (e is B) {
            res |= 0b1000
        }
    }
}

func main() {
    foo()
    print("res is ${res}\n")
    return res - 0b1010
}