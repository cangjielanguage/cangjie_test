// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception in thread "main" default\.Err|An exception has already occurred
// ASSERT: scan throwable_20037.cj:17
var RES = ""

class Err <: Error {}

class A{
    static func a(x:Int64){
        if (x == 1){
            throw Err()
        }
    }
    static func b(x:Int64){
        if (x == 1){
            throw Err()
        }
    }
}

func main() {
    A.a(2)
    A.b(1)
    return 0
}
