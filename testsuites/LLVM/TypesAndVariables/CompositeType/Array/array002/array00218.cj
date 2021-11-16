// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Float32 = 0.0
    var myArray : Array<Array<Float32>> = @{@{a,0.0}}
    return 0
}
