// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : List<Int32> = [1]
    var myArray : Array<Array<List<Int32>>> = @{@{a,[1]}}
    return 0
}
