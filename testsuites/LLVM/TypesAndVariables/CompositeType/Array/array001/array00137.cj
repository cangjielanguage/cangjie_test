// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Option<Int32> = Some<Int32>(1)
    var b : Option<Int32> = None<Int32>
    let myArray0 : Array<Option<Int32>> = @{a,b,Some<Int32>(0)}
    return 0
}

