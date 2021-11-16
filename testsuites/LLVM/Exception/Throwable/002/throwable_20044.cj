// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex execute
// ASSERT: scan success
// ASSERT: scan throwable_20044.cj:13
class A <: Throwable{}
class B <: Throwable{}

func test(): Int64{
    var res = 5
    try{
        let fut: Future<Int64> = spawn {
            throw A()
            return 0
        }
        res = match (fut.getResult()) {
            case Ok(v) => v
            case Err(e) => throw e // res is still 5.
        }
    } catch (e:Throwable){
        e.printStackTrace()
    }
    return res - 5
}

func main() {
    test()
    print("success")
    return 0
}
