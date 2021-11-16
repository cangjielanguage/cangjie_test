// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success
// ASSERT: scan-not failed!

class A <: Throwable{}
class B <: Throwable{}

func test(){
    var t : Future<Int64> = spawn {throw A();print("failed!");1}
    var res = match (t.getResult()) {
        case Ok(v) => v
        case Err(e) => print("${e}"); 10
    }
    return res
}

func main() {
    var res = test()
    print("success")
    return res - 10
}
