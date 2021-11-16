// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Float64 = 1.0
    let myTuple : Float64*Float64 = (1.0,a)
    return 0
}
