// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Throwable{}
class B <: Throwable{}


func test(): Int64{
    var res = 0
    try{
        try{
            throw A()
        } catch(e:B) {
            res = 1
        }
        finally {
            if (res == 1){
                throw Exception()
            } else {
                res = 2
            }
        }
    } catch (e:A){
        if (res == 2){
            res = 3
        }
    }
    return res - 3
}

func main() {
    test()
}
