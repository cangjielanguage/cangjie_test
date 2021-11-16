// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception in thread "main" default.Err|An exception has already occurred
// ASSERT: scan throwable_20036.cj:17
var RES = ""

class Err <: Error {}

class A{
    var a = {x:Int64 =>
        if (x == 1){
            throw Err()
        }
    }(2)
    var b = {x:Int64 =>
        if (x == 1){
            throw Err()
        }
    }(1)
}

func main() {
    A()
    return 0
}
