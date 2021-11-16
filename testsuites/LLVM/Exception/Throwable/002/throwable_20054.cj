// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Throwable{}
class B <: Throwable{}
class C <: Throwable{}

class T{
    T(){
        throw A()
    }
}

func test(){
    var res = -1
    try {
        T()
        ()
    } catch (a:A){
        res = 0
    } catch (_:Throwable) {
        res = -1
    }
    return res
}

func main() {
    return test()
}
