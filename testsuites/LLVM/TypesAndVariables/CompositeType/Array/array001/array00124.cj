// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Char = 'a'
    let myArray : Array<Char> = @{a,'a'}
    return 0
}
