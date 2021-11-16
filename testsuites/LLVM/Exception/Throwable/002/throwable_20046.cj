// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Throwable{}
class B <: Throwable{}

func test(): Int64{
    let f = spawn {
        var res = -1
        try{
            let fut: Future<Int64> = spawn {
                throw A()
                return 0
            }
            res = match (fut.getResult()) {
                case Ok(v) => v
                case Err(e) => 1 // matched
            }
        } catch (e:Throwable){
            e.printStackTrace()
            return -1
        }
        return res
    }
    var res = -1
    res = match (f.getResult()) {
        case Ok(v) => v
        case Err(e) => throw e; 1
    }
    return res - 1
}

func main() {
    test()
}
