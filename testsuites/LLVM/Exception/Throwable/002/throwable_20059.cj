// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Throwable{}
class B <: Throwable{}

class C {
    init(x:Int64){throw B()}
}

func i():Int64{
    throw A()
}

func test(){
    var res = -1
    try {
        C(i())
        ()
    } catch (a:A){
        res = 0
    } catch (e:Throwable) {
        e.printStackTrace()
    }
    return res
}

func main() {
    return test()
}
