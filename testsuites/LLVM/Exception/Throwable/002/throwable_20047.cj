// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan catch!finally!success!

class A <: Throwable{}
class B <: Throwable{}

func test(): Int64{
    var res = 5
    try{
        res = match (Err<Int64>(A())) {
            case Ok(v) => v
            case Err(e) => throw e // res is still 5.
        }
    } catch (e:Throwable){
        print("catch!")
    } finally {
        print("finally!")
    }
    return res - 5
}

func main() {
    test()
    print("success!")
    return 0
}
