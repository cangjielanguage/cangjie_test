// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A <: Throwable{}

var a = true
var b = Err<Bool>(A())

func main(): Int64 {
    if (b ?? a is Bool){ // calculate a is Bool.
        return 0
    }

    return 1
}
