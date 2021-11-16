// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan abcdsuccess
// ASSERT: scan-not failed!

class A <: Throwable{}
class B <: Throwable{}

func test(){
    var t : Future<Int64> = spawn{
        var t : Future<Int64> = spawn{
            var t : Future<Int64> = spawn{
                var t : Future<Int64> = spawn{
                    var t : Future<Int64> = spawn {
                            throw A()
                    }
                    var res = match (t.getResult()) {
                        case Ok(v) => v
                        case Err(e) => print("${e}"); 10
                    }
                    return res
                }
                var res = match (t.getResult()) {
                        case Ok(v) => print("a");v
                        case Err(e) => print("${e}"); 11
                    }
                return res
            }
            var res = match (t.getResult()) {
                        case Ok(v) => print("b");v
                        case Err(e) => print("${e}"); 12
                    }
            return res
        }
        var res = match (t.getResult()) {
                        case Ok(v) => print("c");v
                        case Err(e) => print("${e}"); 13
                    }
        return res
    }
    var res = match (t.getResult()) {
                    case Ok(v) => print("d");v
                    case Err(e) => print("${e}"); 14
                }
    return res
}

func main() {
    var res = test()
    print("success")
    return res - 10
}
