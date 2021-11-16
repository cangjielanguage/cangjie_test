// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : UInt64 = 0
    let myArray : Array<UInt64> = @{a,1}
    return 0
}
