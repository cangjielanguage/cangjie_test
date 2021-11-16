// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Int32 = 0
    let myArray : Array<Int32> = @{a,0}
    return 0
}
