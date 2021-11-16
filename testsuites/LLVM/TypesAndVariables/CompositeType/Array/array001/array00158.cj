// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
var myArray : Array<Int64> = @{0}

func main(): Int64 {
    return myArray[0]
}
