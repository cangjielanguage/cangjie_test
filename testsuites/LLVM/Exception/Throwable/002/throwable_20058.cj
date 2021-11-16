// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Throwable{}

class B {
    var b : Int64 = 1
    B(){
        throw A()
    }
}

class C{
    C(){
        B()
    }
}


func test(){
    var res = -1
    try {
        C()
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
