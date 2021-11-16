// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Float32 = 0.0
    let myArray : Array<Float32> = @{a,0.0,0.1}
    return 0
}
