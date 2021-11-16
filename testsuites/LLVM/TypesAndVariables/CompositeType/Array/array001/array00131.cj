// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a = 0..10:1
    let myArray = @{a,0..10:2}
    let youArray = @{a,0..10}
/*
    var a : Range = 0..10:1
    let myArray : Array<Range> = @{a,0..10:2}
    let youArray : Array<Range> = @{a,0..}
*/
    return 0
}
