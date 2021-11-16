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
            throw A()
        } catch (e:B) {
            x = 1
        } finally {
            f1 = 1
        }
    } catch (e:Throwable) {
        if (x == 0){
            x = 2
        }
    }  finally {
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
