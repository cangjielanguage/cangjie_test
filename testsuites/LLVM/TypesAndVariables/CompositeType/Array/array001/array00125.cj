// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Bool = true
    let myArray : Array<Bool> = @{a,true,false}
    return 0
}
