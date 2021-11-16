// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    var num: Int64 = 1
}

var a: A = A()
func main(): Int64 {
    let fut1: Future<A> = spawn {
        a = A()
        a.num = 2
        return a
    }
    sleep(1000*1000*1000);
    if (a.num != 2 ) {
        return 1
    }
    return 0
}
