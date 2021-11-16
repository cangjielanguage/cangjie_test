// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : String = "a"
    var myArray : Array<Array<String>> = @{@{a,"a"}}
    return 0
}
