// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
//    var a : Range = 0..10:1
//    var myArray : Array<Array<Range>> = @{@{a,0..10:2}}
    var a = 0..10:1
    var myArray = @{@{a,0..10:2}}
    return 0
}
