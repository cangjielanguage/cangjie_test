// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A1 <: Throwable{}
class A2 <: Throwable{}


class B {
    var b : Int64 = 1
    init(){
        throw A1()
    }
}

class C {
    var c : Int64 = 1
    init(){
        throw A2()
    }
}




func test(){
    var res = -1
    try {
        B().b = C().c
    } catch (a:A2){
        res = 0
    } catch (e:Throwable) {
        e.printStackTrace()
    }
    return res
}

func main() {
    return test()
}
