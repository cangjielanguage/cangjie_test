// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var myArray1 : Array<Int32> = @{}
    var myArray2 : Array<Array<Int32>> = @{@{}}
    return 0
}
