// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : UInt32 = 0
    let myArray : Array<UInt32> = @{a,1}
    return 0
}
