// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let myArray = @{1,10}
    let a = myArray[0]..myArray[1]:myArray[0]
    return 0
}
