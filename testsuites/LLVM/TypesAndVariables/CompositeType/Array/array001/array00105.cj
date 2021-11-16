// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var myArray : Array<Int64> = @{1}
    myArray = @{0,0}
    return myArray[1]
}
