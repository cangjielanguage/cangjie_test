// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a = true
var b = Some<Option<Bool>>(None<Bool>)

func main(): Int64 {
    b ?? a as Bool// calculate a is Bool.
    return 0
}
