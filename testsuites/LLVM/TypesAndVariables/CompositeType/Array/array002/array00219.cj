// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Float64 = 0.0
    var myArray : Array<Array<Float64>> = @{@{a,0.0}}
    return 0
}
