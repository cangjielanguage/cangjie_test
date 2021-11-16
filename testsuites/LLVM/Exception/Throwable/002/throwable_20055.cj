// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Throwable{}
class B <: Throwable{}
class C <: Throwable{}



func test(){
    var a : ArrayList<Int64> = ArrayList<Int64>([1,2,3])
    var b = 1
    var res = -1
    try {
        a.set(4,3/(b - 1))
        ()
    } catch (a:ArithmeticException){ // throw ArithmeticException before ArrayIndexOutOfBoundException.
        res = 0
    } catch (e:Throwable) {
        e.printStackTrace()
    }
    return res
}

func main() {
    return test()
}
