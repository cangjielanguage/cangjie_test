// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A <: Throwable{}
class B <: Throwable{}


func test(){
    var x = 0
    var f1 = 0
    var f2 = 0
    try{
        try{
            throw B()
        } catch (e:B) {
            throw A()
        } finally {
            f1 = 1
        }
    } catch (e:A) {
        x = 2
    } finally {
        f2 = 1
    }
    if (f1 == 1 && f2 == 1){
        return x
    } else {
        return -1
    }
}

func main() {
    test() - 2
}
