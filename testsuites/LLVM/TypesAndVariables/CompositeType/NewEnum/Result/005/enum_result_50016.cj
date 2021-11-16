// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A <: Throwable{}

var a = true
var b = Err<Option<Bool>>(A())

func main(): Int64 {
    //b ?? a as Bool// calculate a is Bool.
    return 0
}
