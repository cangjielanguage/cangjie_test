// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex execute
// ASSERT: scan throwable_20045.cj:13
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
                case Err(e) => throw e // matched
            }
        } catch (e:Throwable){
            e.printStackTrace()
            return -1 // matched
        }
        return res // -1
    }
    var res = -2
    res = match (f.getResult()) {
        case Ok(v) => v // -1
        case Err(e) => throw e;2
    }
    return res + 1
}

func main() {
    test()
}
