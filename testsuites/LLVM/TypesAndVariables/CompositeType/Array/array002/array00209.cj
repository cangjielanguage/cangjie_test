// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Int8 = 0
    var myArray : Array<Array<Int8>> = @{@{a,0}}
    return 0
}
